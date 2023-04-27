//
//  CoreData.swift
//  showImage
//
//  Created by Mohan K on 16/03/23.
//

import Foundation
import CoreData
import UIKit

class DataHelp {
    static let sharedInstance = DataHelp()
    
    let context = (UIApplication.shared.delegate as!AppDelegate).persistentContainer.viewContext
    
    func example(data : Data) {
        let imageInstance = User(context: context)
        imageInstance.img = data
        do{
            try context.save()
            print ("Image is saved")
        }
        catch {
            print(error.localizedDescription)
        }
    }
    
    func fetchUser() -> [User] {
        var fetchingUser = [User]()
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        do {
            fetchingUser = try
            context.fetch(fetchRequest) as! [User]
            
        }
        catch {
            print ("Error while fetching the image")

        }
        return fetchingUser
    }
}
