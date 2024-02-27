//
//  SwiftUIView.swift
//  Candy
//
//  Created by Nicolas CHALOYARD on 26/02/2024.
//

import SwiftUI
import SwiftData

struct MenuView: View {
    var body: some View {
        Menu("Menu") {
            Button("Les Entreprises", action: entreprises)
            Button("Les Candidatures", action: candidatures)
            Button("Les Entretiens", action: entretiens)
        }
    }
    
    func entreprises() {
        print("lààà")
    }

    func candidatures() {
        print("làà")
    }
    
    func entretiens() {
        print("là")
    }
}
