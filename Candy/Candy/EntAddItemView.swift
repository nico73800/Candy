//
//  AddItemView.swift
//  Candy
//
//  Created by Nicolas CHALOYARD on 01/03/2024.
//

import SwiftUI
import SwiftData
import Toast

struct EntAddItemView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var modelContext
    
    @State private var id: UUID = UUID()
    @State private var nom: String = ""
    @State private var rue: String = ""
    @State private var ville: String = ""
    @State private var cp: String = ""
    
    var body: some View {
                
        NavigationView {
            Form {
                Text("ID : \(id)")
                
                List {
                    Section("Nom de l'entreprise") {
                        TextField(text: $nom,
                                  prompt: Text("Required")) {
                            Text("Nom de l'entreprise ")
                        }.disableAutocorrection(true)
                    }
                    
                    Section("Adresse") {
                        TextField(text: $rue,
                                  prompt: Text("rue (complète avec numéro (requis)")) {
                            Text("rue (complète avec numéro)")
                        }.disableAutocorrection(true)

                        
                        TextField(text: $ville,
                                  prompt: Text("Ville (requis)")) {
                            Text("ville")
                        }.disableAutocorrection(true)

                        TextField(text: $cp,
                                  prompt: Text("Code Postal (requis)")) {
                            Text("Code Postal")
                        }.disableAutocorrection(true)

                    }
                }
            }
            .navigationTitle(Text("Ajout d'une entreprise"))
            .onSubmit() {
                guard nom.isEmpty == false &&
                    rue.isEmpty == false &&
                    ville.isEmpty == false &&
                        cp.isEmpty == false && cp.count == 5 && cp.isNumber == true
                else {
                    let toast = Toast.text("Erreur : données manquantes | code postal invalide")
                    toast.show()

                    return
                }
                
                addEntrepriseToModel(idE: id, nomE: nom, cpE: cp, rueE: rue, villeE: ville)
                    let toast = Toast.text("Données ajoutées avec succès")
                    toast.show()
            }
            .submitLabel(.send)

        }

        Button("Retour à la page") {
            dismiss()
        }
        
        
    }
    
    private func addEntrepriseToModel(idE: UUID, nomE:String, cpE:String, rueE:String, villeE:String) {
        withAnimation {
            let newItem = Entreprises(id: idE, nom: nomE, CP: cpE, rue: rueE, ville: villeE)
            modelContext.insert(newItem)
        }
    }
    
}

extension String {
    var isNumber: Bool {
        return self.range(
            of: "^[0-9]*$", // 1
            options: .regularExpression) != nil
    }
}
