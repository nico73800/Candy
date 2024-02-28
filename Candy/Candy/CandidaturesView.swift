//
//  ContentView.swift
//  Candy
//
//  Created by Nicolas CHALOYARD on 26/02/2024.
//

import Foundation
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

//                            let _val = self.items[item].getNomEntreprise()
                            
                            VStack(alignment: .trailing) {
                                HStack(alignment: .lastTextBaseline) {
                                    
                                    NavigationLink {
                                        GroupBox(label:
                                            Label("Candidatures", systemImage: "newspaper")
                                        ) {
                                            Text("ID : \(item.idCandidatures.uuidString)")
                                                .frame(maxWidth: .infinity, alignment: .leading)
                                                .font(.body.bold())

                                            List {
                                                Text("\(item.entreprise.nom.uppercased())")
                                                    .frame(maxWidth: .infinity, alignment: .leading)
                                                Text("\(item.entreprise.rue) \(item.entreprise.ville) \(item.entreprise.CP) ")
                                                    .frame(maxWidth: .infinity, alignment: .leading)
                                                Text("\(item.resp)")
                                                    .frame(maxWidth: .infinity, alignment: .leading)
                                                Text("\(item.date.formatted(date: .complete, time: .omitted))")
                                                    .frame(maxWidth: .infinity, alignment: .leading)

                                            }
                                            .padding(0)
                                            .contentMargins(5)
                                            .cornerRadius(20)
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                        }
                                        .padding(10)
                                        .cornerRadius(20)

                                        
                                    } label: {
                                        Text("Numéro candidature : \(item.idCandidatures.uuidString)")
                                    }
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                }
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
