//
//  StoreType.swift
//  ChefDelivery
//
//  Created by rafael.guimaraes on 07/08/23.
//

import Foundation

struct StoreType: Identifiable {
    let id: Int
    let name: String
    let logoImage: String
    let headerImage: String //Imagem grande...
    let location: String //Nome da rua
    let stars: Int //Num de estrelas...
    
    let products: [ProductType]
}
