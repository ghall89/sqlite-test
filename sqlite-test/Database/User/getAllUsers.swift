import Foundation
import GRDB

func getAllUsers() -> [User] {
	var allUsers: [User] = []
	
	do {
		let dbQueue = try connectToDb()
		try dbQueue?.read { db in
			let request = User.all()
			allUsers = try request.fetchAll(db)
		}
	} catch {
		print(error)
	}
	
	return allUsers
}
