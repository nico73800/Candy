//
//  CategoryViews.swift
//  Candy
//
//  Created by Nicolas CHALOYARD on 26/02/2024.
//

import SwiftUI

struct CategoryViews: View {
    private var categs = ["Entreprises", "Candidatures", "Entretiens"]
    var body: some View {
        TabView {
            MainView()
                .tabItem{
                    Label("Home", systemImage: "house")
                }
            EntreprisesView()
                .tabItem{
                    Label("Entreprises", systemImage: "building")
                }
            
        }

    }
}

#Preview {
    CategoryViews()
}
