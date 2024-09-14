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

    var container: ModelContainer = {
        do {
            let schema = Schema([
                Candidatures.self,
                Entreprises.self,
            ])
            
            let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false, allowsSave: true)
            
            return try ModelContainer(for: schema, configurations: [modelConfiguration])

        } catch {
            var d = Del()
            d.deleteData()
            fatalError("Failed to configure DB : \(error)")
        }
    }()


    var body: some Scene {
        WindowGroup {
            CategoryView()
        }
        .modelContainer(container)
    }
}

class Del {
    @Environment(\.modelContext) private var modelContext
    func deleteData() {
        do {
            try modelContext.delete(model: Candidatures.self)
        } catch {
            print("Failed to delete Candidatures")
        }
        do {
            try modelContext.delete(model: Entreprises.self)
        } catch {
            print("Failed to delete Entreprises")
        }
    }
}

// TODO:
// - add menu links : done
// - add pages associated to links : done
// - add data persistance : done
// - add all input to update data (Entreprises & Candidatures)
// - add style to pages (CandidaturesView & EntreprisesView) to be more pleasant to see
// --> Box around item text content
// --> label distinct from content
// --> padding, bold, and stuff like that

