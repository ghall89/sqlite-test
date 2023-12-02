import Foundation
import SQLiteORM

struct User: Initializable, Identifiable {
	var id = 0
	var first_name = ""
	var last_name = ""
	var username = ""
	var email = ""
}
