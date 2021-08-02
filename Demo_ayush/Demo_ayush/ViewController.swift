//
//  ViewController.swift
//  Demo_ayush
//
//  Created by daffolapmac-179 on 23/12/20.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblEmail: UILabel!
    @IBOutlet weak var lblContact: UILabel!
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtContact: UITextField!
    @IBOutlet weak var btnSave: UIButton!
    var student = [Students]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        student = DatabaseHelper.sharedInstance.getData()
    }
    
    @IBAction func btnChangeLanguageEnglish(_ sender: Any) {
        changeLanguage(str: "en")
    }
    
    @IBAction func btnChangeLanguage(_ sender: Any) {
        changeLanguage(str: "ru")
        
    }
    
    @IBAction func btnChangeLanguageHindi(_ sender: Any) {
        changeLanguage(str: "hi")
    }
    
    @IBAction func btnSaveClick(_ sender: Any) {
        let dict = ["name":txtName.text,"email":txtEmail.text,"contact":txtContact.text]
        DatabaseHelper.sharedInstance.save(object: dict as! [String : String])
        
    }
    
    func changeLanguage(str:String) {
        lblName.text = "Name".addLocalizableString(str: str)
        lblEmail.text = "Email".addLocalizableString(str: str)
        lblContact.text = "Contact Number".addLocalizableString(str: str)
        txtName.text = "Hey, Push in your name".addLocalizableString(str: str)
        txtEmail.text  = "Hey, Push in your mail id".addLocalizableString(str: str)
        txtContact.text = "Hey, Push in your number".addLocalizableString(str: str)
        //btnSave.buttonType = "Save".addLocalizableString(str: str)
    }
    
}
extension String{
    func addLocalizableString(str:String) -> String{
        let path = Bundle.main.path(forResource: str, ofType: "lproj")
        let bundle = Bundle(path: path!)
        return NSLocalizedString(self, tableName: nil, bundle: bundle!, value: "", comment: "")
    }
}

