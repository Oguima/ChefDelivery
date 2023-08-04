//
//  OrderTypeGridView.swift
//  ChefDelivery
//
//  Created by rafael.guimaraes on 03/08/23.
//

import SwiftUI

struct OrderTypeGridView: View {
    var body: some View {
        /*
         Grid {
            GridRow {
                Text("2a feira")
                Text("3a feira")
                Text("4a feira")
            }
            
            Divider()
            
            GridRow {
                Text("Engenharia")
                Text("Redes")
                Text("Mat")
            }
        }*/
        
        /*let orders = [
            "Restaurantes",
            "Farmácia",
            "Descontos",
            "Gourmet",
            "Mercados",
            "Pet",
            "Bebidas"
        ]*/
        
        var gridLayout: [GridItem] {
            return Array(repeating: GridItem(.flexible(), spacing: 10), count: 2)
        }
        
        LazyHGrid(rows:
            /*[GridItem(.fixed(100)),
            GridItem(.fixed(100))]*/
            gridLayout, spacing: 15
        ) {
            //Lista de GridIcons
            //Pega o ID automagico: id: \.self
            //ForEach(orders, id: \.self) { orderItem in
            ForEach(ordersMock) { orderItem in
                HStack{
                    OrderTypeView(orderType: orderItem)
                }
            }
        }
        .frame(height: 200)
        .padding(.horizontal, 15)
        .padding(.top, 15)
    }
}

struct OrderTypeGridView_Previews: PreviewProvider {
    static var previews: some View {
        OrderTypeGridView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
