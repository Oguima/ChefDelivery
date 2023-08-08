//
//  StoreItemView.swift
//  ChefDelivery
//
//  Created by rafael.guimaraes on 03/08/23.
//

import SwiftUI

struct StoreItemView: View {
    
    let order: OrderType
    
    var body: some View {
        HStack {
            Image(order.image)
                .resizable()
                .scaledToFit()
                .cornerRadius(25)
                .frame(width: 50, height: 50)
            
            VStack { //Para poder colocar novos textos abaixo
                Text(order.name)
                    .font(.subheadline)
            }
            
            Spacer() //Ocupa espaço disponivel...
        }
        //O onTap bloqueou a navegação do navigationLink...
        /*.onTapGesture {
            print("Clicou em \(order.name)")
        }*/
    }
}

struct StoreItemView_Previews: PreviewProvider {
    static var previews: some View {
        StoreItemView(order:
            OrderType(id: 1,
                      name: "Monstro Burger",
                      image: "monstro-burger-logo")
        )
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
