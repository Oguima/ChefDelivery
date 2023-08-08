//
//  ProductType.swift
//  ChefDelivery
//
//  Created by rafael.guimaraes on 07/08/23.
//

import Foundation

struct ProductType: Identifiable {
    let id: Int
    let name: String
    let description: String
    let image: String
    let price: Double
    
    //propriedade computada... precisa ser var
    var formatedPrice: String {
        return "R$" + price.formatPrice()
    }
    
}
