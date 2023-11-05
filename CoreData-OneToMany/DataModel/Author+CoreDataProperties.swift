//
//  Author+CoreDataProperties.swift
//  CoreData-OneToMany
//
//  Created by Randy McKown on 11/5/23.
//
//

import Foundation
import CoreData


extension Author {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Author> {
        return NSFetchRequest<Author>(entityName: "Author")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var authorToBook: Set<Book>?
    public var books: [Book] {
        let setOfBooks = authorToBook
        return setOfBooks!.sorted{($0.id < $1.id)}
    }

}

// MARK: Generated accessors for authorToBook
extension Author {

    @objc(addAuthorToBookObject:)
    @NSManaged public func addToAuthorToBook(_ value: Book)

    @objc(removeAuthorToBookObject:)
    @NSManaged public func removeFromAuthorToBook(_ value: Book)

    @objc(addAuthorToBook:)
    @NSManaged public func addToAuthorToBook(_ values: NSSet)

    @objc(removeAuthorToBook:)
    @NSManaged public func removeFromAuthorToBook(_ values: NSSet)

}

extension Author : Identifiable {

}
