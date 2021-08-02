//
//  EmployeeNewViewController.swift
//  AppBuild
//
//  Created by daffolapmac-179 on 29/10/20.
//

import UIKit

class EmployeeNewViewController: UIViewController {
    
    @IBOutlet weak var JoiningDateTxt: UITextField!
    let datepicker = UIDatePicker()

    override func viewDidLoad() {
        super.viewDidLoad()
        createDatePicker()
    }
    func createDatePicker(){
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donepressed))
        toolbar.setItems([doneBtn], animated: true)
        
        JoiningDateTxt.inputAccessoryView = toolbar
        
        JoiningDateTxt.inputView = datepicker
        
        datepicker.datePickerMode = .date
    }
    @objc func donepressed(){
        JoiningDateTxt.text = "\(datepicker)"
        self.view.endEditing(true)
        
    }
    

    

}
