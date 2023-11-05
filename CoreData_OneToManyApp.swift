//
//  CoreData_OneToManyApp.swift
//  CoreData-OneToMany
//
//  Created by Randy McKown on 11/5/23.
//

import SwiftUI

@main
struct CoreData_OneToManyApp: App {
    let persistenceController = DataController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
