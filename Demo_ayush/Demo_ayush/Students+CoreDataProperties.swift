//
//  Students+CoreDataProperties.swift
//  Demo_ayush
//
//  Created by daffolapmac-179 on 28/12/20.
//
//

import Foundation
import CoreData


extension Students {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Students> {
        return NSFetchRequest<Students>(entityName: "Students")
    }

    @NSManaged public var contact: String?
    @NSManaged public var emailid: String?
    @NSManaged public var name: String?

}

extension Students : Identifiable {

}
