import SQLiteORM

let usersSchema = Table<User>(
	name: "users",
	columns:
		Column(name: "id", keyPath: \User.id, constraints: primaryKey(), notNull()),
		Column(name: "first_name", keyPath: \User.first_name, constraints: notNull()),
		Column(name: "last_name", keyPath: \User.last_name, constraints: notNull()),
		Column(name: "username", keyPath: \User.username, constraints: notNull(), unique()),
		Column(name: "email", keyPath: \User.email, constraints: notNull(), unique())
)

let licenseSchema = Table<License>(
	name: "app_licenses",
	columns:
		Column(name: "id", keyPath: \License.id, constraints: primaryKey(), notNull()),
		Column(name: "software_name", keyPath: \License.softwareName, constraints: notNull()),
		Column(name: "license_key", keyPath: \License.licenseKey, constraints: notNull()),
		Column(name: "registered_to_name", keyPath: \License.registeredToName, constraints: notNull()),
		Column(name: "registered_to_email", keyPath: \License.registeredToEmail, constraints: notNull()),
		Column(name: "download_url", keyPath: \License.downloadUrlString, constraints: notNull()),
		Column(name: "notes", keyPath: \License.notes, constraints: notNull())
)
