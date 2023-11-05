//
//  AuthorListCell.swift
//  CoreData-OneToMany
//
//  Created by Randy McKown on 11/3/23.
//

import SwiftUI

struct AuthorListCell: View {
    @Environment(\.managedObjectContext) private var viewContext
    @ObservedObject var book: Book
    
    var body: some View {
        VStack{
            HStack{
                VStack(alignment: .leading){
                    NavigationLink(destination: {
                        BookDetails(book: book)
                    }, label: {
                        Text("Book : " + (book.title ?? "")).font(.title2)
                    })
                }
            }
        }
        .swipeActions(edge:.trailing){
            Button(role:.destructive,action: {
                deleteAuthor()
            },label:{
                Label("Delete Author",systemImage: "trash")
            })
        }
    }
    
    private func deleteAuthor(){
        let authorToDelete = book
        do{
            viewContext.delete(authorToDelete)
            try viewContext.save()
        }
        catch{
            print("Error while deleting employee \(error.localizedDescription)")
        }
    }
}
