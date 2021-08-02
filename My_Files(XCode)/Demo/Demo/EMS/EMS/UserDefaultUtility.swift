//
//  UserDefaultUtility.swift
//  EMS
//
//  Created by daffolapmac-179 on 12/01/21.
//

import Foundation
class UserDefaultUtility {
    
    private init() { }
    private let userDefaults = UserDefaults.standard
    
    static var sharedInstance = UserDefaultUtility()
    
    func save(emplyees: [Employee]) {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(emplyees) {
            userDefaults.set(encoded, forKey: "emplyees")
            userDefaults.synchronize()
        }
    }
    
    func getEmployees() -> [Employee] {
        if let savedPerson = userDefaults.object(forKey: "emplyees") as? Data {
            let decoder = JSONDecoder()
            if let employees = try? decoder.decode([Employee].self, from: savedPerson) {
                return employees
            }
        }
        
        return []
    }
}
