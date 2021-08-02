//
//  Employee.swift
//  EMS
//
//  Created by daffolapmac-179 on 03/11/20.
//

import Foundation

struct Employee {
    var name: String?
    var email: String?
    var number: String?
    var address: String?
    var salary: String?
    var dateofJoin: String?
}
    
//    init(name: String, email: String, number: Int, address: String, salary: Int, dateofJoin: Int) {
//        self.name = name
//        self.email = email
//        self.number = number
//        self.address = address
//        self.salary = salary
//        self.dateofJoin = dateofJoin
//    }
//    // MARK: NSCoding
////    required convenience init?(coder: NSCoder) {
////        guard let name = coder.decodeObject(forKey: "name") as? String
////                else { return nil }
////        self.init(name:name)
////    }
//
//    required init(coder aDecoder:NSCoder){
//        self.name = aDecoder.decodeObject(forKey: "Name") as! String
//        self.email = aDecoder.decodeObject(forKey: "Email") as! String
//        self.number = aDecoder.decodeObject(forKey: "Number") as! Int
//        self.address = aDecoder.decodeObject(forKey: "Address") as! String
//        self.salary = aDecoder.decodeObject(forKey: "Salary") as! Int
//        self.dateofJoin = aDecoder.decodeObject(forKey: "Date") as! Int
//    }
////    func initWithCoder(aDecoder: NSCoder) -> Employee {
////        self.name = aDecoder.decodeObject(forKey: "Name") as? String
////        self.email = aDecoder.decodeObject(forKey: "Email") as? String
////        self.number = aDecoder.decodeObject(forKey: "Number") as? Int
////        self.address = aDecoder.decodeObject(forKey: "Address") as? String
////        self.salary = aDecoder.decodeObject(forKey: "Salary") as? Int
////        self.dateofJoin = aDecoder.decodeObject(forKey: "Date") as? Int
////        return self
////    }
//    func encode(with aCoder: NSCoder){
//        aCoder.encode(name, forKey: "Name")
//        aCoder.encode(email, forKey: "Email")
//        aCoder.encode(number, forKey: "Number")
//        aCoder.encode(address, forKey: "Address")
//        aCoder.encode(salary, forKey: "Salary")
//        aCoder.encode(dateofJoin, forKey: "Date")
//    }



//}

 
