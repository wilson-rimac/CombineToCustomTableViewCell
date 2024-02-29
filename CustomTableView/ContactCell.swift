import UIKit
import Combine

class ContactCell: UITableViewCell {

    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var firstName: UILabel!
    @IBOutlet weak var lastName: UILabel!
    @IBOutlet weak var phoneNumber: UILabel!
    
    var currentContact: ContactModel?
    let action = PassthroughSubject<ContactModel, Never>()
    
    func updateCellView(contact: ContactModel) {
        currentContact = contact
        icon.image = UIImage(named: contact.icon)
        firstName.text = contact.firstName
        lastName.text = contact.lastName
        phoneNumber.text = contact.phoneNumber
    }

    @IBAction func callTapped(_ sender: Any) {
        if let contact = currentContact {
            action.send(contact)
        }
    }
}
