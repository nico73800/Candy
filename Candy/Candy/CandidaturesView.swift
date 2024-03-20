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
    @Query private var entreprises: [Entreprises]

    // Variable globale pour les dates
    private let dt = Date.FormatStyle()
        .locale(Locale(identifier: "fr_FR"))

    // Variable globale autres
    // Booléan pour les affichages de vue
    @State private var showingSheet = false
    
    var body: some View {
  
            NavigationSplitView {
                
                if items.isEmpty {
                    Text("Rien à afficher")
                    .toolbar {
                        ToolbarItem {
                            Button("Add Item") {
                                showingSheet.toggle()
                                
                            }
                            
                            .sheet(isPresented: $showingSheet) {
                                CanAddItemView()
                            }
                        }
                    }
                    
                } else {
                    
                    List {
                        ForEach(items) { item in
                                                        
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
                                                Text("\(item.entreprise.nom)")
                                                    .frame(maxWidth: .infinity, alignment: .leading)
                                                
                                                Text("\(item.entreprise.rue) - \(item.entreprise.ville), \(item.entreprise.CP) ")
                                                    .frame(maxWidth: .infinity, alignment: .leading)
                                                
                                                Text("\(item.resp)")
                                                    .frame(maxWidth: .infinity, alignment: .leading)
                                                
                                                Text("\(item.date.formatted(self.dt))")
                                                    .frame(maxWidth: .infinity, alignment: .leading)

                                            }
                                        }
                                        .padding(10)
                                        .cornerRadius(20)

                                    } label: {
                                        Text("Candidature : \(item.entreprise.nom) au \(item.date.formatted(self.dt))")
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
                        Button("Add Item") {
                            showingSheet.toggle()
                        }
                        .sheet(isPresented:$showingSheet) {
                            CanAddItemView()
                        }
                        
                    }
                    
                }
                    
            }
                
        } detail: {
            Text("Select an item")
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(items[index])
            }
        }
    }
    
    private func getEntrepriseFromItem(id:UUID) -> [Entreprises] {
        return entreprises.filter { $0.idEnt == id }
    }
    
}
