//
//  BookDetails.swift
//  CoreData-OneToMany
//
//  Created by Randy McKown on 11/3/23.
//

import SwiftUI

struct BookDetails: View {
    @Environment(\.managedObjectContext) private var viewContext
    @ObservedObject var book: Book
    
    var body: some View {
        Text(book.title ?? "")
    }
}
