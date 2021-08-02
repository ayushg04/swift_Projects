//
//  AddViewController.swift
//  EMS
//
//  Created by daffolapmac-179 on 02/11/20.
//

import UIKit

enum ScreenType {
    case detail, add, edit
}

protocol SecondViewControllerDelegate: AnyObject {
    func add(employee: Employee?)
    func update(employee: Employee?, at index:Int)
}

class SecondViewController: UIViewController,UITextFieldDelegate {
    
    @IBOutlet private weak var adddetailsLbl: UILabel!
    @IBOutlet private weak var nameLbl: UILabel!
    @IBOutlet private weak var nameTextField: UITextField!
    @IBOutlet private weak var emailLbl: UILabel!
    @IBOutlet private weak var emailTextField: UITextField!
    @IBOutlet private weak var addressLbl: UILabel!
    @IBOutlet private weak var addressTextField: UITextField!
    @IBOutlet private weak var phoneLbl: UILabel!
    @IBOutlet private weak var numberTextField: UITextField!
    @IBOutlet private weak var salaryLbl: UILabel!
    @IBOutlet private weak var salaryTextField: UITextField!
    @IBOutlet private weak var dateofJoiningLbl: UILabel!
    @IBOutlet private weak var dateJoiningTextField: UITextField!
    @IBOutlet private weak var saveBtn: UIButton!
    weak var delegate: SecondViewControllerDelegate?

    var type: ScreenType = .add
    var employee: Employee?
    var index: Int = -1
    
    // MARK: - Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.delegate = self
        emailTextField.delegate = self
        numberTextField.delegate = self
        addressTextField.delegate = self
        salaryTextField.delegate = self
        dateJoiningTextField.delegate = self
        
        self.hideKeyboardWhenTappedAround()
        
        if type == .edit {
            nameTextField.isUserInteractionEnabled = true
            emailTextField.isUserInteractionEnabled = true
            numberTextField.isUserInteractionEnabled = true
            addressTextField.isUserInteractionEnabled = true
            salaryTextField.isUserInteractionEnabled = true
            dateJoiningTextField.isUserInteractionEnabled = true
            // Pre fill the dtaa with editable
            nameTextField.text = employee?.name
            emailTextField.text = employee?.email
            numberTextField.text = employee?.number
            addressTextField.text = employee?.address
            salaryTextField.text = employee?.salary
            dateJoiningTextField.text = employee?.dateofJoin
            
            saveBtn.setTitle("Update", for: .normal)
        } else if type == .detail {
            nameTextField.isUserInteractionEnabled = false
            emailTextField.isUserInteractionEnabled = false
            numberTextField.isUserInteractionEnabled = false
            addressTextField.isUserInteractionEnabled = false
            salaryTextField.isUserInteractionEnabled = false
            dateJoiningTextField.isUserInteractionEnabled = false
            nameTextField.text = employee?.name
            emailTextField.text = employee?.email
            numberTextField.text = employee?.number
            addressTextField.text = employee?.address
            salaryTextField.text = employee?.salary
            dateJoiningTextField.text = employee?.dateofJoin
            
            // Prefill the data with not editable
//            adddetailsLbl.setTitle("Edit Employee", for: .normal)
            saveBtn.setTitle("Edit", for: .normal)
        } else {
            
            // Do not prefill the data
//            adddetailsLbl.setTitle("Edit Employee", for: .normal)
            saveBtn.setTitle("Save", for: .normal)
        }
    }
    

    @IBAction func didTapSubmitButton(_ sender: UIButton){
        
       // self.employeeSaveData()
        
        
        //MARK:- SCREEN TYPES
        switch type {
        case .edit:
            
            // Save Data and Need to go to Listing screen
            if isValidtext() {
                // Create Model with updated data
                employee = Employee(name: nameTextField.text,
                                    email: emailTextField.text,
                                    number: numberTextField.text,
                                    address: addressTextField.text,
                                    salary: salaryTextField.text,
                                    dateofJoin: dateJoiningTextField.text)
                
                delegate?.update(employee: employee, at: index)
                navigationController?.popToRootViewController(animated: true)
            }
            
        case .detail:
            let storyBoard = UIStoryboard(name: "Main", bundle: nil)
            let editVC: SecondViewController = storyBoard.instantiateViewController(identifier: "SecondViewController")
            editVC.type = .edit
            editVC.employee = employee
            editVC.index = index
            editVC.delegate = self
            delegate?.update(employee: employee, at: index)
            self.navigationController?.pushViewController(editVC ,animated:true)
            
        case .add:
            employee = Employee(name: nameTextField.text, email: emailTextField.text, number: numberTextField.text, address: addressTextField.text,
                                salary: salaryTextField.text, dateofJoin: dateJoiningTextField.text)
            if (isValidtext()) {
                delegate?.add(employee: employee)
                self.navigationController?.popViewController(animated:true)
            }
        }
    }
    //MARK:-VALIDATING CONSTRAINTS
    func isValidtext() -> Bool {
        
        guard let name = self.nameTextField.text?.trimmed(), name.count > 0 else {
            showAlert(message: "Name is Mandatory")
            return false
        }
        
        guard let email = self.emailTextField.text?.trimmed() else {
            showAlert(message: "Email is Mandatory")
            return false
        }
        
        if !Utility.isValidEmail(str: email){
            showAlert(message: "Email is Not Correct")
            return false
        }
        
        guard let _ = self.addressTextField.text?.trimmed() else {
            showAlert(message: "Address is Mandatory")
            return false
        }
        
        guard let number = self.numberTextField.text?.trimmed() else {
            showAlert(message: "Number is Mandatory")
            return false
        }
        
        if !Utility.isValidNumber(str: number) {
            showAlert(message: "Number is Not Correct")
            return false
        }
        
        guard let _ = self.salaryTextField.text?.trimmed() else {
            showAlert(message: "Salary is Mandatory")
            return false
        }

        guard let dateJoin = self.dateJoiningTextField.text?.trimmed() else {
            showAlert(message: "Date of Joining is Mandatory")
            return false
        }
        
        let validDate = DateFormatter()
        validDate.dateFormat = "dd/mm/yyyy"
        if validDate.date(from: dateJoin) == nil {
            showAlert(message: "Date is Not Correct")
            return false
        }
        
        return true
    }
    
}


extension SecondViewController: SecondViewControllerDelegate {
    
    func add(employee: Employee?) {
        delegate?.add(employee: employee)
    }
    
    func update(employee: Employee?, at index: Int) {
        delegate?.update(employee: employee, at: index)
    }
}

private extension SecondViewController {
    func showAlert(message: String?, title: String = "") {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        
        self.present(alert, animated: true)
    }
}

//MARK:- HIDE KEYBOARD
extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        //        let tap1 = UIReturnKeyType = UIReturnKeyType(rawValue: <#Int#>, target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

extension String {
    func trimmed() -> String? {
        return self.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    }
}
extension SecondViewController{
    
//    self.employeeSaveData()
    
}
