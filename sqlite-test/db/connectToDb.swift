import Foundation
import SQLiteORM

func connectToDb() -> Storage? {
	let fileManager = FileManager.default
	
	let documentDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first!
	let dbPath = String(describing: documentDirectory.appendingPathComponent("db.sqlite"))
	
	if !fileManager.fileExists(atPath: dbPath) {
		let success = fileManager.createFile(atPath: dbPath, contents: nil, attributes: nil)
		
		if success {
			print("File created at: \(dbPath)")
		} else {
			print("Failed to create file")
		}
	}
	
	do {
		let storage = try Storage(
			filename: dbPath,
			tables:
				usersSchema,
				licenseSchema
		)
		
		try storage.syncSchema(preserve: true)
		
		return storage
	} catch {
		print("error happened \(error)")
		return nil
	}
}


