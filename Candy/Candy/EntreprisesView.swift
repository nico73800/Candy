//
//  EntreprisesView.swift
//  Candy
//
//  Created by Nicolas CHALOYARD on 26/02/2024.
//

import SwiftUI
import SwiftData

struct EntreprisesView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Entreprises]

    var body: some View {
  
            NavigationSplitView {
                if items.isEmpty {
                    Text("Rien à afficher")
                    .toolbar {
                        /*
                        ToolbarItem(placement: .navigationBarTrailing) {
                            EditButton()
                        }
                         */
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
                                Text("Item n° \(item.idEnt)")
                            } label: {
                                Text(item.nom)
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
            let newItem = Entreprises(id: UUID(), nom: "golum", CP: "12345", rue: "1 rue des cétacés", ville: "Golum Ville")
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
    EntreprisesView()
        .modelContainer(for: Entreprises.self, inMemory: true)

}
