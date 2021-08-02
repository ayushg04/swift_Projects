//
//  ViewController.swift
//  ems2
//
//  Created by daffolapmac-179 on 12/01/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var lblAddEmployee: UILabel!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var lblEmail: UILabel!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var lblAddress: UILabel!
    @IBOutlet weak var txtAddress: UITextField!
    @IBOutlet weak var lblContact: UILabel!
    @IBOutlet weak var txtContact: UITextField!
    @IBOutlet weak var btnSave: UIButton!
    var student = [Students]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        student = DatabaseHelper.sharedInstance.getdata()
    }
    @IBAction func onclickSave(_ sender: Any) {
        let dict = ["name":txtName.text,"email":txtEmail.text,"address":txtAddress.text,"contact":txtContact.text]
        DatabaseHelper.sharedInstance.save(object: dict as! [String : String])
    }
    

}

