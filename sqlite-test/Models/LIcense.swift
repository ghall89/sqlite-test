import Foundation
import SQLiteORM
import AppKit

struct License: Initializable, Identifiable {
	var id: String = UUID().uuidString
	var softwareName: String = ""
	var licenseKey: String = ""
	var registeredToName: String = ""
	var registeredToEmail: String = ""
	var downloadUrlString: String = ""
	var notes: String = ""
}
