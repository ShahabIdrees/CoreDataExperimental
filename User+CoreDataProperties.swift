//
//  User+CoreDataProperties.swift
//  LoginSignup
//
//  Created by Shahab Idrees  on 23/11/2025.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var firstName: String?
    @NSManaged public var lastname: String?
    @NSManaged public var password: String?
    @NSManaged public var email: String?

}

extension User : Identifiable {

}
