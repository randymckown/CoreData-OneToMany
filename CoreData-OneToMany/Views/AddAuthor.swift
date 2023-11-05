//
//  AddAuthor.swift
//  CoreData-OneToMany
//
//  Created by Randy McKown on 11/3/23.
//

import SwiftUI

struct AddAuthor: View {
    @Environment(\.managedObjectContext) var viewContext
    @Environment(\.dismiss) var dismiss
    
    @State var authorName = ""
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    VStack {
                        TextField("Enter Author Name", text: $authorName)
                    }
                    Button {
                        DataController().addAuthor(context: viewContext, authorName: authorName)
                        dismiss()
                    } label: {
                        Text("Save")
                            .frame(minWidth:0, maxWidth: .infinity)
                    }
                    .buttonStyle(.bordered)
                    .buttonBorderShape(.roundedRectangle)
                    .tint(.blue)
                }
            }
            .navigationTitle("Add Author")
        }
    }
}

#Preview {
    AddAuthor()
}
