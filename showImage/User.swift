//
//  User.swift
//  showImage
//
//  Created by Mohan K on 17/03/23.
//

import Foundation

import CoreData

public class User : NSManagedObject {
    
}

extension User {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }
    @NSManaged public var img: Data?
    @NSManaged public var username: String?
    @NSManaged public var password: String?
    @NSManaged public var email: String?

}
