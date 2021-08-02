//
//  Utility.swift
//  EMS
//
//  Created by daffolapmac-179 on 10/11/20.
//

import UIKit

class Utility: NSObject {
    static func isValidEmail(str: String) -> Bool{
        let emailEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let testmail = NSPredicate(format: "SELF MATCHES %@", emailEx)
        return testmail.evaluate(with: str)
    }
    static func isValidNumber(str: String) -> Bool{
        let phoneEx = "^[0-9]{10}"
        let testphone = NSPredicate(format: "SELF MATCHES %@", phoneEx)
        return testphone.evaluate(with: str)
    }
    static func isValidAddress(str: String) -> Bool{
        let addressEx = "^[A-Za-z0-9]{5,20}"
        let testAddress = NSPredicate(format: "SELF MATCHES %@", addressEx)
        return testAddress.evaluate(with: str)
    }
    static func isValidSalary(str: String) -> Bool{
        let salaryEx = "^[0-9]{5}"
        let testSalary = NSPredicate(format: "SELF MATCHES %@", salaryEx)
        return testSalary.evaluate(with: str)
    }
    static func isValidName(str: String) -> Bool{
        let nameEx = "^[a-zA-Z]{7,18}"
        let testName = NSPredicate(format: "SELF MATCHES %@", nameEx)
        return testName.evaluate(with: str)
    }
}
