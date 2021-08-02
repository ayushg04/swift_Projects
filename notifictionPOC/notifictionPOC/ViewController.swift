import UIKit

class ViewController: UIViewController {
    var call = dummy()
    private var observer: NSObjectProtocol?
    @IBOutlet weak var dummyLabel: UILabel!
    override func viewDidLoad() {
        call.param()
        super.viewDidLoad()
        observer = NotificationCenter.default.addObserver(forName: UIApplication.willEnterForegroundNotification, object: nil, queue: .main) { [unowned self] notification in
            print("Enters ForeGround")
        }
        observer = NotificationCenter.default.addObserver(forName: UIApplication.didEnterBackgroundNotification, object: nil, queue: .main) { [unowned self] notification in
            print("Enters BackGround")
        }
        print("\(call.name)")
//        print("\(call.name)")
    }
    
    
    
}
class dummy {
    var name = "String"
    static var name2 = "Ayush"
    func param() {
        print("Ayush")
    }
}
