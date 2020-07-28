import Foundation

struct ContactModel {
    var icon: String
    var firstName: String
    var lastName: String
    var phoneNumber: String
    
    init(icon: String, firstName: String, lastName: String, phoneNumber: String) {
        self.icon = icon
        self.firstName = firstName
        self.lastName = lastName
        self.phoneNumber = phoneNumber
    }
}
