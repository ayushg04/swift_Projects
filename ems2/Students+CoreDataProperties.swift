//
//  Students+CoreDataProperties.swift
//  ems2
//
//  Created by daffolapmac-179 on 18/01/21.
//
//

import Foundation
import CoreData


extension Students {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Students> {
        return NSFetchRequest<Students>(entityName: "Students")
    }

    @NSManaged public var name: String?
    @NSManaged public var email: String?
    @NSManaged public var address: String?
    @NSManaged public var contact: String?

}

extension Students : Identifiable {

}
