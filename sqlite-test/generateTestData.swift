import Foundation

func generateTestData() -> [User] {
	func generateRandomUser() -> User {
		let firstNames = ["John", "Jane", "Alice", "Bob", "Charlie", "David", "Emily", "Frank", "Grace", "Henry"]
		let lastNames = ["Doe", "Smith", "Johnson", "Brown", "Williams", "Jones", "Miller", "Davis", "Garcia", "Rodriguez"]
		let usernames = ["user1", "user2", "user3", "user4", "user5", "user6", "user7", "user8", "user9", "user10"]
		let domains = ["gmail.com", "yahoo.com", "outlook.com", "example.com", "domain.com"]
		
		let randomFirstName = firstNames.randomElement()!
		let randomLastName = lastNames.randomElement()!
		let randomUsername = usernames.randomElement()!
		let randomEmail = "\(randomUsername)@\(domains.randomElement()!)"
		
		return User(first_name: randomFirstName, last_name: randomLastName, username: randomUsername, email: randomEmail)
	}
	
	var randomUsers: [User] = []
	
	for _ in 1...12 {
		let randomUser = generateRandomUser()
		randomUsers.append(randomUser)
	}
	
	return randomUsers
}
