//
//  ContentView.swift
//  Candy
//
//  Created by Nicolas CHALOYARD on 26/02/2024.
//

import SwiftUI
import SwiftData

struct CandidaturesView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Candidatures]

    var body: some View {
  
            NavigationSplitView {
                if items.isEmpty {
                    Text("Rien à afficher")
                    .toolbar {
                        ToolbarItem {
                            Button(action: addItem) {
                                Label("Add Item", systemImage: "plus")
                            }
                        }
                    }
                } else {
                    List {
                        ForEach(items) { item in
                            NavigationLink {
                                Text("Candidatures n° \(item.idCandidatures.uuidString)")
                            } label: {
                                Text("Numéro candidature : \(item.idCandidatures.uuidString)")
                            }
                        }
                        .onDelete(perform: deleteItems)
                    }
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        EditButton()
                    }
                    ToolbarItem {
                        Button(action: addItem) {
                            Label("Add Item", systemImage: "plus")
                        }
                    }
                }
            }
        } detail: {
            Text("Select an item")
        }
    }

    private func addItem() {
        withAnimation {
            let newItem = Candidatures(id: UUID(), date: Date.now, entreprise: Entreprises(id: UUID(), nom: "golum", CP: "12345", rue: "1 rue des cétacés", ville: "Golum Ville"), resp: "Eh macarena")
            modelContext.insert(newItem)
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(items[index])
            }
        }
    }
}

#Preview {
    CandidaturesView()
        .modelContainer(for: Candidatures.self, inMemory: true)
}
