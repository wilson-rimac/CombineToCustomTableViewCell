import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //Create outlet for the tableview
    @IBOutlet weak var contactTableView: UITableView!
    
    //create some initial contacts to use to fill the tableview cells
    var contacts = [
        ContactModel(icon: "laptop-user.png", firstName: "Bob", lastName: "Thomas", phoneNumber: "717-322-5583"),
        ContactModel(icon: "laptop-user.png", firstName: "Tim", lastName: "Carter", phoneNumber: "484-732-3912"),
        ContactModel(icon: "laptop-user.png", firstName: "Jim", lastName: "Golden", phoneNumber: "215-830-9848")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //assign tableview delegate and datasource
        contactTableView.delegate = self
        contactTableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "contactCell", for: indexPath) as? ContactCell {
            let extractedContact = contacts[indexPath.row]
            
            //call the update view function from ContactCell
            cell.UpdateCellView(contact: extractedContact)
            return cell
        }
        else {
            return ContactCell()
        }
    }
}

