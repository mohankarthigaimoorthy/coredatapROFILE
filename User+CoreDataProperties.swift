//
//  User+CoreDataProperties.swift
//  showImage
//
//  Created by Mohan K on 16/03/23.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var email: String?
    @NSManaged public var img: Data?
    @NSManaged public var password: String?
    @NSManaged public var username: String?

}

extension User : Identifiable {

}
