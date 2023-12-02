import SwiftUI

struct ContentView: View {
	
	@State private var users: [User] = []
	@State private var newItemSheet: Bool = false
	@State private var sortOrder = [KeyPathComparator(\User.lastName)]
	@State private var selection = Set<User.ID>()
	
	var body: some View {
		VStack {
			Table(
				users,
				selection: $selection,
				sortOrder: $sortOrder,
				columns: {
					TableColumn("First Name", value: \.firstName)
					TableColumn("Last Name", value: \.lastName)
					TableColumn("Username", value: \.username)
					TableColumn("Email", value: \.email)
				})
			.onChange(of: sortOrder) { _, sortOrder in
				users.sort(using: sortOrder)
			}
			
		}
		.toolbar(content: {
			ToolbarItem {
				Button(action: {
					deleteUsers(selection)
					handleFetchData()
				}, label: {
					Image(systemName: "trash")
				})
				.disabled(selection.isEmpty)
			}
			ToolbarItem {
				Button(action: {
					newItemSheet.toggle()
				}, label: {
					Image(systemName: "plus")
				})
			}
		})
		.sheet(isPresented: $newItemSheet, content: {
			NewUserForm()
		})
		.onAppear(perform: handleFetchData)
		.onChange(of: newItemSheet, handleFetchData)
	}
	
	private func handleFetchData() {
		let data = getAllUsers()
		users = data
	}
}

struct NewUserForm: View {
	@Environment(\.dismiss) private var dismiss
	@State var firstName: String = ""
	@State var lastName: String = ""
	@State var userName: String = ""
	@State var email: String = ""
	
	var body: some View {
		Form {
			TextField("First Name", text: $firstName)
			TextField("Last Name", text: $lastName)
			TextField("Username", text: $userName)
			TextField("Email", text: $email)
			Button(action: {
				do {
					let newUser = User(firstName: firstName, lastName: lastName, username: userName, email: email)
					try createUser(newUser)
				} catch {
					print(error)
				}
				
				dismiss()
			}, label: {
				Text("Save")
			})
		}
		.frame(width: 300)
		.padding()
	}
}
