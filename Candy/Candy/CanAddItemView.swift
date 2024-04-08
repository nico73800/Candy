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
                Button("Ajout des données") {
                    let valEntreprise = estPresent(entreprises: entreprises, idATester: selectedValue) ?? nil
                    guard valEntreprise != nil &&
                            responsable.isEmpty == false
                    else {
                        let toast = Toast.text("Erreur : données manquantes")
                        toast.show()

                        return
                    }
                    addCandidatureToModel(idC: id, date: date, entreprise: valEntreprise.unsafelyUnwrapped, responsable: responsable)
                        let toast = Toast.text("Données ajoutées avec succès")
                        toast.show()
                    dismiss()
                    return

                }

            }
            .navigationTitle(Text("Ajout d'une candidature"))
            
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
    
    private func estPresent(entreprises: [Entreprises], idATester: UUID) -> Entreprises? {
        var entreprise: Entreprises?
        for ent in entreprises {
            if ent.idEnt == selectedValue {
                entreprise = ent
            }
        }
        return entreprise
    }
}

