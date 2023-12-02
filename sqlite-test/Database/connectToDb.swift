import Foundation
import GRDB

func connectToDb() throws -> DatabaseQueue? {
	let fileManager = FileManager.default
	do {
		let dbPath = try fileManager.url(
			for: .documentDirectory,
			in: .userDomainMask,
			appropriateFor: nil,
			create: true
		).appendingPathComponent("db.sqlite")
		
		let storage = try DatabaseQueue(path: dbPath.absoluteString)
		
		return storage
	} catch {
		return nil
	}
}


