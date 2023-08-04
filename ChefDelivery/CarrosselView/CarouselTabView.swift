//
//  CarroselTabView.swift
//  ChefDelivery
//
//  Created by rafael.guimaraes on 03/08/23.
//

import SwiftUI

struct CarouselTabView: View {
    
    let ordersMock: [OrderType] = [
        OrderType(id: 1, name: "banner burguer", image: "barbecue-banner"),
        OrderType(id: 2, name: "banner prato feito", image: "brazilian-meal-banner"),
        OrderType(id: 3, name: "banner poke", image: "pokes-banner"),
        ]
    
    var body: some View {
        TabView {
            ForEach(ordersMock) { mock in
                CarouselItemView(order: mock)
            }
        }
        .frame(height: 180) //altura
        .tabViewStyle(.page(indexDisplayMode: .always)) //paginacao
    }
}

struct CarouselTabView_Previews: PreviewProvider {
    static var previews: some View {
        CarouselTabView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
