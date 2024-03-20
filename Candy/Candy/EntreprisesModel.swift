//
//  EntreprisesModel.swift
//  Candy
//
//  Created by Nicolas CHALOYARD on 27/02/2024.
//

import Foundation
import SwiftUI
import SwiftData

@Model
final class Entreprises {
    
    @Attribute(.unique) var idEnt: UUID = UUID()
    
    @Relationship(deleteRule: .cascade, inverse: \Candidatures.entreprise) var candidatures: [Candidatures]
    
    var nom: String
    var CP: String
    var rue: String
    var ville: String

    
    init(id: UUID, nom: String, CP: String, rue: String, ville: String, candidatures: [Candidatures] = []) {
        self.idEnt = id
        self.nom = nom
        self.CP = CP
        self.rue = rue
        self.ville = ville
        self.candidatures = candidatures
    }
    
    func genID() -> UUID {
        return UUID()
    }
}
