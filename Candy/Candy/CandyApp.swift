//
//  CandyApp.swift
//  Candy
//
//  Created by Nicolas CHALOYARD on 26/02/2024.
//

import SwiftUI
import SwiftData

@main
struct CandyApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
//            MenuView()
            MainView()
            CategoryView()
        }
        .modelContainer(sharedModelContainer)
    }
}

// TODO:
// - add menu links
// - add pages associated to links

