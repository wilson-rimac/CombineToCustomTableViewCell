import UIKit
import Combine

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //Create outlet for the tableview
    @IBOutlet weak var contactTableView: UITableView!
    
    //create some initial contacts to use to fill the tableview cells
    var contacts = [
        ContactModel(icon: "laptop-user.png", firstName: "Bob", lastName: "Thomas", phoneNumber: "717-322-5583"),
        ContactModel(icon: "laptop-user.png", firstName: "Tim", lastName: "Carter", phoneNumber: "484-732-3912"),
        ContactModel(icon: "laptop-user.png", firstName: "Jim", lastName: "Golden", phoneNumber: "215-830-9848")
    ]
    
    var observer: AnyCancellable?
    var observers: [AnyCancellable] = []


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
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "contactCell", for: indexPath) as? ContactCell else {
            fatalError("Could not dequeue ContactCell")
        }
        let contact = contacts[indexPath.row]
        cell.updateCellView(contact: contact)
        subscribeToCellActions(cell, at: indexPath)
        return cell
    }
    
    private func subscribeToCellActions(_ cell: ContactCell, at indexPath: IndexPath) {
        
        cell.action.sink { [weak self] currentContact in
            print("Calling to: \(currentContact.firstName)")
        }.store(in: &observers)
        
        /*
         //Usar esto por ejemplo si se usa un xib y no varios elementos como una celda
        observer = cell.action.sink { [weak self] currentContact in
            print("Calling to: \(currentContact.firstName)")
        }*/
    }
}

