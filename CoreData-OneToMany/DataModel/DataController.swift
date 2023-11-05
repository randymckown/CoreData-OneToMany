//
//  Persistence.swift
//  CoreData-OneToMany
//
//  Created by Randy McKown on 11/5/23.
//

import CoreData

struct DataController {
    static let shared = DataController()

    let container: NSPersistentContainer

    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "CoreData_OneToMany")
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.

                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        container.viewContext.automaticallyMergesChangesFromParent = true
    }
    
    func save(context: NSManagedObjectContext) {
        do {
            try context.save()
        }
        catch{
            print("Error while saving Release Data \(error.localizedDescription)")
        }
    }
    
    func addAuthor(context: NSManagedObjectContext, authorName: String) {
        let newAuthor = Author(context: context)
        newAuthor.id = UUID()
        newAuthor.name = authorName
        save(context: context)
    }
    
    func editAuthor(context: NSManagedObjectContext, authorName: String) {
        let newAuthor = Author(context: context)
        newAuthor.name = authorName
        save(context: context)
    }
    
    func addBook(bookTitle: String, author: Author, context: NSManagedObjectContext){
        let newBook = Book(context: context)
        newBook.id = UUID()
        newBook.title = bookTitle
        newBook.bookToAuthor = author
        save(context: context)
    }
    
    func editBook(bookTitle: String, author: Author, context: NSManagedObjectContext){
        let newBook = Book(context: context)
        newBook.title = bookTitle
        newBook.bookToAuthor = author
        save(context: context)
    }
}
