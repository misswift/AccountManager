//
//  DataService.swift
//  accountManager
//
//  Created by Халим Магомедов on 31.03.2022.
//

import Foundation
import UIKit
import CoreData

protocol UserDataFetchServiceProtocol {
    func saveUserData(login : String, password: String)
    func getUserData() -> [Any]
    func saveСontext()
}

class UserDataService: UserDataFetchServiceProtocol {
    
    var context : NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    
    func saveUserData(login : String, password: String) {
        let entity = NSEntityDescription.entity (forEntityName: "Notes", in: self.context)
        let newUserData = NSManagedObject (entity: entity! , insertInto: self.context)
        newUserData.setValue(login, forKey: "login")
        newUserData.setValue(password, forKey: "password")
        
        saveСontext()
    }
    
    func getUserData() -> [Any]{
        let request = NSFetchRequest <NSFetchRequestResult> (entityName: "UserData")
        request.returnsObjectsAsFaults = false
        do {
            return try context.fetch(request)
        } catch {
            print("Receive error")
            return []
        }
    }
    
    
    func saveСontext() {
        do {
            try self.context.save ()
        } catch {
            print ("Save failed")
        }
    }
    
}

