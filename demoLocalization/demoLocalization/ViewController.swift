import UIKit

class ViewController: UIViewController {

    
    
    @IBOutlet var firstName: UILabel!
    @IBOutlet var lastName: UILabel!
    @IBOutlet weak var check: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        languageChange()
    }
    

    
    func languageChange() {
        firstName.text = NSLocalizedString("FirstNameKey", comment: "")
        lastName.text = NSLocalizedString("LastNameKey", comment: "")
    }
}

extension String{
    var localised: String {
        return NSLocalizedString(self, comment: "")
    }
}
