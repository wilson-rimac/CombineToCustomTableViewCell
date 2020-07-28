import UIKit

class ContactCell: UITableViewCell {

    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var firstName: UILabel!
    @IBOutlet weak var lastName: UILabel!
    @IBOutlet weak var phoneNumber: UILabel!
    
    func UpdateCellView(contact: ContactModel) {
        icon.image = UIImage(named: contact.icon)
        firstName.text = contact.firstName
        lastName.text = contact.lastName
        phoneNumber.text = contact.phoneNumber
    }

}
