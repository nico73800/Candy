//
//  CategoryViews.swift
//  Candy
//
//  Created by Nicolas CHALOYARD on 26/02/2024.
//

import SwiftUI

struct CategoryView: View {
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
            CandidaturesView()
                .tabItem{
                    Label("Candidatures", systemImage: "newspaper")
                }
        }

    }
}

#Preview {
    CategoryView()
}
