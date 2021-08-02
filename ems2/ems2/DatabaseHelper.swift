//
//  DatabaseHelper.swift
//  ems2
//
//  Created by daffolapmac-179 on 18/01/21.
//

import Foundation
import CoreData
import UIKit
class DatabaseHelper{
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    static var sharedInstance = DatabaseHelper()
    func save(object:[String:String]){
        let student = NSEntityDescription.insertNewObject(forEntityName: "Students", into: context) as! Students
        student.name = object["name"]
        student.email = object["email"]
        student.address = object["address"]
        student.contact = object["contact"]
        do{
            try context.save()
        }catch{
            print("Data is not saved")
        }
    }
    func getdata() -> [Students]{
        var student = [Students]()
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Students")
        do{
            student = try context.fetch(fetchRequest) as! [Students]
        } catch {
            print("Data is not fetch")
        }
        return student
    }
}
