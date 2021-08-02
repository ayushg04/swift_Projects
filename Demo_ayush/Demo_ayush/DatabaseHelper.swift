//
//  DatabaseHelper.swift
//  Demo_ayush
//
//  Created by daffolapmac-179 on 28/12/20.
//

import Foundation
import CoreData
import UIKit
class DatabaseHelper{
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    static var sharedInstance = DatabaseHelper()
    func save(object:[String:String]){
        let student = NSEntityDescription.insertNewObject(forEntityName:"Students", into: context) as! Students
        student.name = object["name"]
        student.emailid = object["email"]
        student.contact = object["contact"]
        do{
            try context.save()
        }catch{
            print("Data is not save")
        }
        
    }
    
    func getData() -> [Students] {
        var student = [Students]()
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Students")
        do{
            student = try context.fetch(fetchRequest) as! [Students]
        }catch{
            print("Data is not fetch")
        }
        
        return student
    }
    
}
