//
//  DataService.swift
//  accountManager
//
//  Created by Халим Магомедов on 31.03.2022.
//

import Foundation
import UIKit
import CoreData

class NotesService : NSObject {
    
    var context : NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    
    func saveNote(text : String) {
        let entity = NSEntityDescription.entity (forEntityName: "Notes", in: self.context)
        let newNotes = NSManagedObject (entity: entity! , insertInto: self.context)
        
        let randomId = String(Int.random(in: 1000...10000))
        
        newNotes.setValue(text, forKey: "text")
        newNotes.setValue(randomId, forKey: "id")
        
        saveСontext()
    }
    
    func getNotes() -> [Any]{
        let request = NSFetchRequest <NSFetchRequestResult> (entityName: "Notes")
        request.returnsObjectsAsFaults = false
        do {
            return try context.fetch(request)
        } catch {
            print("Receive error")
            return []
        }
    }
    
//    func removeNote(note : Notes)  {
//        context.delete(note)
//        
//        saveСontext()
//    }
//    
//    func updateNote(note : Notes, text : String) {
//        
//        note.setValue(text, forKey: "text")
//        
//        saveСontext()
//    }
    
    func saveСontext() {
        do {
            try self.context.save ()
        } catch {
            print ("Save failed")
        }
    }
    
}

