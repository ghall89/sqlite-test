import Foundation
import SQLiteORM

func getAllUsers() -> [User] {
	var userArray: [User] = []
	
	do {
		if let storage = connectToDb() {
			let allUsers: [User] = try storage.getAll()
			for user in allUsers {
				userArray.append(user)
			}
		}
	} catch {
		print(error)
	}
	
	return userArray
}
