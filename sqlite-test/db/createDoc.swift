import Foundation
import SQLiteORM

func createDoc<T: Initializable>(data: T) {
	print(data)
	if let storage = connectToDb() {
		do {
			let newData = try storage.insert(data)
			print(newData)
		} catch {
			print(error)
		}
	}
}
