//
//  AddBook.swift
//  CoreData-OneToMany
//
//  Created by Randy McKown on 11/3/23.
//

import SwiftUI

struct AddBook: View {
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.dismiss) private var dismiss
    
    @State private var bookTitle = ""
    @State private var selectedAuthor = Author()
    
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \Author.name, ascending: true)]) private var authors:FetchedResults<Author>
    
    var body: some View {
        NavigationView{
            Form{
                TextField("Enter Book Title", text: $bookTitle)
                
                Picker("Select Author", selection: $selectedAuthor){
                    ForEach(authors,id: \.self){
                        Text($0.name ?? "Unknown")
                    }
                }
                
                Button(action: {
                    DataController().addBook(bookTitle: bookTitle, author: selectedAuthor, context: viewContext)
                    dismiss()
                }, label: {
                    Text("Save Book")
                        .frame(minWidth:0, maxWidth: .infinity)
                })
                    .buttonStyle(.bordered)
                    .buttonBorderShape(.roundedRectangle)
                    .tint(.blue)
            }
            .navigationTitle("Add Book")
        }
        .onAppear {
            selectedAuthor = authors.first ?? Author()
        }
    }
}

#Preview {
    AddBook()
}
