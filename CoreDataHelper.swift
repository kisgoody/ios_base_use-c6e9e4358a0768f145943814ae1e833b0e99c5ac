//
//  CoreDataHelper.swift
//  ios_base_use
//
//  Created by EDF on 16/11/11.
//  Copyright © 2016年 EDF. All rights reserved.
//

import Foundation
import UIKit
import User.h

class CoreDataHelper: NSObject{
    let store: CoreDataStore!
    
    override init(){
        // all CoreDataHelper share one CoreDataStore defined in AppDelegate
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        self.store = appDelegate.cdstore
        
        super.init()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "contextDidSaveContext:", name: NSManagedObjectContextDidSaveNotification, object: nil)
    }
    
    func  manageDB(){
        let appDelegate =  UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.cdh.managedObjectContext
        var row:User = NSEntityDescription.insertNewObjectForEntityForName("User",inManagedObjectContext:managedContext!) as! User
          row.username = "hello coredata"
        row.password = "wow"
        var error: NSError?
        if !managedContext!.save(&error) {
            print("Could not save (error), (error?.userInfo)")
        }        //fetch families        NSLog(" ======== Fetch ======== ")        
        var fReq: NSFetchRequest = NSFetchRequest(entityName: "User")
        fReq.predicate = NSPredicate(format:"username CONTAINS 'h' ")
        var sorter: NSSortDescriptor = NSSortDescriptor(key: "username" , ascending: false)
        fReq.sortDescriptors = [sorter]
        fReq.returnsObjectsAsFaults = false
        var result = managedContext!.executeFetchRequest(fReq, error:&error)
        for resultItem in result! {            var useritem = resultItem as! User
            PrintUtils.printLog("username",message: "Fetched Family for (useritem.username) ")
        }
    }
    
    deinit{
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
    // #pragma mark - Core Data stack
    
    // Returns the managed object context for the application.
    // Normally, you can use it to do anything.
    // But for bulk data update, acording to Florian Kugler's blog about core data performance, [Concurrent Core Data Stacks – Performance Shootout](http://floriankugler.com/blog/2013/4/29/concurrent-core-data-stack-performance-shootout) and [Backstage with Nested Managed Object Contexts](http://floriankugler.com/blog/2013/5/11/backstage-with-nested-managed-object-contexts). We should better write data in background context. and read data from main queue context.
    // If the context doesn't already exist, it is created and bound to the persistent store coordinator for the application.
    
    // main thread context
    
    lazy var managedObjectContext: NSManagedObjectContext? = {
        // Returns the managed object context for the application (which is already bound to the persistent store coordinator for the application.) This property is optional since there are legitimate error conditions that could cause the creation of the context to fail.
        let coordinator = self.store.persistentStoreCoordinator
        if coordinator == nil {
            return nil
        }
        var managedObjectContext = NSManagedObjectContext(concurrencyType: NSManagedObjectContextConcurrencyType.MainQueueConcurrencyType)
        managedObjectContext.persistentStoreCoordinator = coordinator
        return managedObjectContext
        }()
    
    // Returns the background object context for the application.
    // You can use it to process bulk data update in background.
    // If the context doesn't already exist, it is created and bound to the persistent store coordinator for the application.
    
    lazy var backgroundContext: NSManagedObjectContext? = {
        // Returns the managed object context for the application (which is already bound to the persistent store coordinator for the application.) This property is optional since there are legitimate error conditions that could cause the creation of the context to fail.
        let coordinator = self.store.persistentStoreCoordinator
        if coordinator == nil {
            return nil
        }
        var backgroundContext = NSManagedObjectContext(concurrencyType: NSManagedObjectContextConcurrencyType.PrivateQueueConcurrencyType)
        backgroundContext.persistentStoreCoordinator = coordinator
        return backgroundContext
        }()
    
    
    // save NSManagedObjectContext
    func saveContext (context: NSManagedObjectContext) {
        var error: NSError? = nil
        if context.hasChanges && !context.save(&error) {
            // Replace this implementation with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog("Unresolved error \(error), \(error!.userInfo)")
            abort()
        }
    }
    
    func saveContext () {
        self.saveContext( self.backgroundContext! )
    }
    
    // call back function by saveContext, support multi-thread
    func contextDidSaveContext(notification: NSNotification) {
        let sender = notification.object as! NSManagedObjectContext
        if sender === self.managedObjectContext {
            NSLog("******** Saved main Context in this thread")
            self.backgroundContext!.performBlock {
                self.backgroundContext!.mergeChangesFromContextDidSaveNotification(notification)
            }
        } else if sender === self.backgroundContext {
            NSLog("******** Saved background Context in this thread")
            self.managedObjectContext!.performBlock {
                self.managedObjectContext!.mergeChangesFromContextDidSaveNotification(notification)
            }
        } else {
            NSLog("******** Saved Context in other thread")
            self.backgroundContext!.performBlock {
                self.backgroundContext!.mergeChangesFromContextDidSaveNotification(notification)
            }
            self.managedObjectContext!.performBlock {
                self.managedObjectContext!.mergeChangesFromContextDidSaveNotification(notification)
            }
        }
    }
    
    
}