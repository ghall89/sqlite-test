import Foundation
import GRDB

struct User: Identifiable, Codable, FetchableRecord, PersistableRecord {
	var id: UUID = UUID()
	var firstName: String
	var lastName: String
	var username: String
	var email: String
	
	init(firstName: String, lastName: String, username: String, email: String) {
		self.firstName = firstName
		self.lastName = lastName
		self.username = username
		self.email = email
	}
}
