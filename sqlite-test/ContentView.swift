import SwiftUI
import SQLiteORM

struct ContentView: View {
	
	@State private var users: [User] = []
	@State private var newItemSheet: Bool = false
	
	var body: some View {
		VStack {
			Table(users, columns: {
				TableColumn("First Name", value: \.first_name)
				TableColumn("Last Name", value: \.last_name)
				TableColumn("Username", value: \.username)
				TableColumn("Email", value: \.email)
			})
		}
		.toolbar(content: {
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
		
		for item in data {
			users.append(item)
		}
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
				let newUser = User(id: 1, first_name: firstName, last_name: lastName, username: userName, email: email)
				createDoc(data: newUser)
				dismiss()
			}, label: {
				Text("Save")
			})
		}
		.frame(width: 300)
		.padding()
	}
}
