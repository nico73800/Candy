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
    
    @Query(sort: [SortDescriptor(\Candidatures.idCandidatures)])
    private var allCandidatures: [Candidatures]

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
                            EntAddItemView()
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
                                                Label("Entreprises", systemImage: "building")
                                    ) {
                                        Text("ID : \(item.idEnt)")
                                            .frame(maxWidth:.infinity, alignment: .leading)
                                            .font(.body.bold())
                                        
                                        List {
                                            Text("\(item.nom.uppercased())")
                                                .frame(maxWidth: .infinity, alignment: .leading)
                                            
                                            Text("\(item.rue) \(item.ville) \(item.CP)")
                                                .frame(maxWidth: .infinity, alignment: .leading)
                                        }
                                        .padding(0)
                                        .contentMargins(5)
                                        .clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous))
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        
                                    }
                                    .padding(10)
                                    .clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous))

                                } label: {
                                    Text("Entreprise : \(item.nom)")
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
                        .sheet(isPresented: $showingSheet) {
                            EntAddItemView()
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
}

//#Preview {
//    EntreprisesView()
//        .modelContainer(for: Entreprises.self, inMemory: true)
//
//}
