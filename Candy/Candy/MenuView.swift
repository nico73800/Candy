//
//  SwiftUIView.swift
//  Candy
//
//  Created by Nicolas CHALOYARD on 26/02/2024.
//

import SwiftUI

struct MenuView: View {
    var body: some View {
        Menu("Options") {
            Button("Les Entreprises", action: entreprises)
            Button("Les Candidatures", action: candidatures)
            Button("Les Entretiens", action: entretiens)
        }
    }
    
    func entreprises() {
        print("là")
    }

    func candidatures() {
        print("là")
    }
    
    func entretiens() {
        print("là")
    }
}
