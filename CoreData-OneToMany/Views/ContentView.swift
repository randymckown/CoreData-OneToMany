//
//  ContentView.swift
//  CoreData-OneToMany
//
//  Created by Randy McKown on 11/5/23.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \Author.name, ascending: true)]) private var authors:FetchedResults<Author>
    
    @State private var addAuthor = false
    @State private var addBook = false

    var body: some View {
        NavigationView {
            List {
                ForEach(authors) { author in
                    NavigationLink(destination: {
                        List{
                            ForEach(author.books) { book in
                                AuthorListCell(book: book)
                            }
                        }
                        .navigationTitle("Books by : " + (author.name ?? ""))
                    }, label: {
                        Text(author.name ?? "")
                    })
                }
                .onDelete(perform: deleteAuthor)
            }
            .navigationTitle("Core Data Demo")
            .sheet(isPresented: $addAuthor){
                AddAuthor()
            }
            .sheet(isPresented: $addBook){
                AddBook()
            }
            .toolbar {
                ToolbarItemGroup(placement:.navigationBarTrailing){
                    Button(action: {
                        addAuthor.toggle()
                    }, label: {
                        Label("Add Author",systemImage: "person.fill")
                    })
                    Button(action: {
                        addBook.toggle()
                    }, label: {
                        Label("Add Book", systemImage: "text.book.closed.fill")
                    })
                }
            }
        }
    }
    
    
    private func deleteAuthor(offsets: IndexSet){
        withAnimation {
            offsets.map { authors[$0] }.forEach(viewContext.delete)
            DataController().save(context: viewContext)
        }
    }
}

//#Preview {
//    ContentView().environment(\.managedObjectContext, DataController.preview.container.viewContext)
//}
