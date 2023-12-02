import Foundation
import GRDB

func createUser(_ data: User) throws {
	do {
		let dbQueue = try connectToDb()
		
		try dbQueue?.write { db in
			try data.insert(db)
		}
	} catch {
		print(error)
	}
}
