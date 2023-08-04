//
//  CarouselItemView.swift
//  ChefDelivery
//
//  Created by rafael.guimaraes on 03/08/23.
//

import SwiftUI

struct CarouselItemView: View {
    
    let order: OrderType
    
    var body: some View {
        Image(order.image)
            .resizable() //permite reescala
            .scaledToFit() //Imagem nao destorce
            .cornerRadius(12)
        
    }
}

struct CarouselItemView_Previews: PreviewProvider {
    static var previews: some View {
        CarouselItemView(order:
            OrderType(id: 1,
                      name: "teste",
                      image: "pokes-banner"))
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
