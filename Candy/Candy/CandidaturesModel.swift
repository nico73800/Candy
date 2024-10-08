//
//  CandidaturesModel.swift
//  Candy
//
//  Created by Nicolas CHALOYARD on 27/02/2024.
//

import Foundation
import SwiftUI
import SwiftData

@Model
final class Candidatures {
    
    @Attribute(.unique) var idCandidature: UUID = UUID()
    
    var date: Date
    var entreprise: Entreprises
    var resp: String
    
    init(id: UUID, date: Date, entreprise: Entreprises, resp: String) {
        self.idCandidature = id
        self.date = date
        self.entreprise = entreprise
        self.resp = resp
    }
    
    func convertUUID() -> String {
        return self.idCandidature.uuidString
    }
    
}
