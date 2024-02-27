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
//    var sharedModelContainer: ModelContainer = {
//        let schema = Schema([
//            Item.self,
//        ])
//        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)
//
//        do {
//            return try ModelContainer(for: schema, configurations: [modelConfiguration])
//        } catch {
//            fatalError("Could not create ModelContainer: \(error)")
//        }
//    }()
    var container: ModelContainer = {
        do {
            
            let schema = Schema([
                Candidatures.self,
                Entreprises.self,
            ])
            
            let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false, allowsSave: true)

//            let configCand = ModelConfiguration(for: Candidatures.self, isStoredInMemoryOnly: false)
//            let configEnt = ModelConfiguration(for: Entreprises.self, isStoredInMemoryOnly: false)
            
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Failed to configure DB");
        }
    }()

    var body: some Scene {
        WindowGroup {
//            MenuView()
            MainView()
            CategoryView()
        }
        .modelContainer(container)
    }
}

// TODO:
// - add menu links : done
// - add pages associated to links : done
// - add data persistance : done
// - add all input to update data (Entreprises & Candidatures)

