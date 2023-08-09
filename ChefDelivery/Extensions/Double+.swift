//
//  Double+.swift
//  ChefDelivery
//
//  Created by rafael.guimaraes on 07/08/23.
//

import Foundation

extension Double {
    func formatPrice() -> String {
        let formatedString = String(format: "%.2f", self) //minha instancia do tipo double.
        //Mudar de ponto para virgula...
        return formatedString.replacingOccurrences(of: ".", with: ",")
    }
}
