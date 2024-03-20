//
//  CanAddITemView.swift
//  Candy
//
//  Created by nicolas chaloyard on 02/03/2024.
//

import SwiftUI
import Toast
import SwiftData

struct CanAddItemView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var modelContext

    @Query private var entreprises: [Entreprises]
    
    @State private var id: UUID = UUID()
    @State private var responsable: String = ""
    @State private var date: Date = Date.now
    @State private var selectedValue: UUID = UUID()
    
    // Variable globale pour les dates
    private let dt = Date.FormatStyle()
        .locale(Locale(identifier: "fr_FR"))

    var body: some View {
        
        NavigationView {
            
            Form {
                
                Text("ID : \(id)")
                
                List {
                    Section("L'entreprise") {
                        Picker("Veuillez choisir une entreprise", selection: $selectedValue) {
                            ForEach(entreprises) { elem in
                                Text("\(elem.nom)").tag(elem.idEnt)
                            }
                        }
                    }
                    
                    Section("Le responsable") {
                        TextField(text: $responsable, prompt: Text("Nom et prénom du / de la responsable (requis)")) {
                            Text("Nom et prénom du / de la responsable")
                        }.disableAutocorrection(true)
                    }
                    
                    Text("Date selectionnée : \(date.formatted(self.dt))")
                    
                    Section("Date de candidature") {
                        DatePicker("Date de candidature",
                                   selection: $date,
                                   displayedComponents: [.date]
                        )
                        .datePickerStyle(.graphical)
                    }
                }
            }
            .navigationTitle(Text("Ajout d'une entreprise"))
            .onSubmit() {
                let here: Bool = estPresent(entreprises: entreprises, idATester: selectedValue)
                
                guard here == true  &&
                        responsable.isEmpty == false
                else {
                    let toast = Toast.text("Erreur : données manquantes")
                    print(responsable.isEmpty, here)
                    toast.show()

                    return
                }
                let ent: [Entreprises] = entreprises.filter { $0.idEnt == selectedValue }
                addCandidatureToModel(idC: id, date: date, entreprise: ent[0], responsable: responsable)
                    let toast = Toast.text("Données ajoutées avec succès")
                    toast.show()
                            }
            .submitLabel(.send)

            

        }

        Button("Retour à la page") {
            dismiss()
        }
        
    }
    private func addCandidatureToModel(idC: UUID, date: Date, entreprise: Entreprises, responsable: String) {
        withAnimation {
            let newItem = Candidatures(id: idC, date: date, entreprise: entreprise, resp: responsable)
            modelContext.insert(newItem)
        }
    }
    
    private func estPresent(entreprises: [Entreprises], idATester: UUID) -> Bool {
        var here: Bool = false
        for ent in entreprises {
            if ent.idEnt == selectedValue {
                here = true
            } else {
                here = false
            }
        }
        return here
    }
}

