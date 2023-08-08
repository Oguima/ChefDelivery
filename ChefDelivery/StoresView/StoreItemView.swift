//
//  StoreItemView.swift
//  ChefDelivery
//
//  Created by rafael.guimaraes on 03/08/23.
//

import SwiftUI

struct StoreItemView: View {
    
    let store: StoreType
    
    var body: some View {
        HStack {
            Image(store.logoImage)
                .resizable()
                .scaledToFit()
                .cornerRadius(25)
                .frame(width: 50, height: 50)
            
            VStack { //Para poder colocar novos textos abaixo
                Text(store.name)
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
        StoreItemView(store:
            storesMock[0]
        )
        .previewLayout(.sizeThatFits)
        .padding()
    }
}
