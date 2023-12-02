import Foundation
import GRDB

func deleteUsers(_ ids: Set<User.ID>) {
	do {
		let dbQueue = try connectToDb()
		
		try dbQueue?.write { db in
			let deleted = try User.deleteAll(db, ids: ids)
			print("Deleted \(deleted) users")
		}
	} catch {
		print(error)
	}
}
