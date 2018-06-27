import UIKit

protocol AddTask {
    func addTask(_name: String,_description: String)
}

class AddTaskController: UIViewController {
    
    var delegate: AddTask!
    
    @IBOutlet weak var newTaskText: UITextField!
    @IBOutlet weak var descriptionText: UITextField!
    
    @IBAction func addTackAction(_ sender: Any) {
        if newTaskText.text != ""
        {
            delegate.addTask(_name: newTaskText.text!,_description:descriptionText.text! )
            navigationController?.popViewController(animated: true)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


}
