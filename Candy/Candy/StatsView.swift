//
//  StatsModel.swift
//  Candy
//
//  Created by nicolas chaloyard on 28/03/2024.
//

import Foundation
import SwiftUI
import SwiftData
import Charts

struct StatsView: View {
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \Candidatures.date) private var candidatures: [Candidatures]
    
    private let dt = Date.FormatStyle()
        .locale(Locale(identifier: "fr_FR"))
    
    // Variable globale autres
    // Booléan pour les affichages de vue
    @State private var showingSheet = false
    
    // View pour les statistiques
    var body: some View {
                    
        if candidatures.isEmpty {
            Text("Rien à afficher")
        } else {
            Chart(candidatures, id: \.date) {
                BarMark(
                    x: .value("Mois", $0.date, unit: .month),
                    y: .value("Nombre", $0.date)
                )
            }
        }
    }
}
