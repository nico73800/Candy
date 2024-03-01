//
//  AlertView.swift
//  Candy
//
//  Created by Nicolas CHALOYARD on 01/03/2024.
//

import SwiftUI

class AlertView: UIViewController {
    @IBAction func showAlertButtonTapped(_ sender: UIButton) {

        // create the alert
        let alert = UIAlertController(title: "Erreur !", message: "Données vides", preferredStyle: UIAlertController.Style.alert)

        // add an action (button)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))

        // show the alert
        self.present(alert, animated: true, completion: nil)
    }
}

#Preview {
    AlertView()
}
