//
//  ProductDetailView.swift
//  ChefDelivery
//
//  Created by rafael.guimaraes on 08/08/23.
//

import SwiftUI

struct ProductDetailView: View {
    
    let product: ProductType
    
    var body: some View {
        VStack {
            VStack (alignment: .leading, spacing: 16) {
                Image(product.image)
                    .resizable()
                    .scaledToFit()
                    .shadow(radius: 20)
                
                Text(product.name)
                    .font(.title)
                    .bold()
                    .padding(.horizontal)
                
                Text(product.description)
                    .padding(.horizontal)
                
                Text(product.formatedPrice)
                    .font(.title3)
                    .bold()
                    .padding(.horizontal)
            }
            
            Spacer()
            
            Button {
                print("Botão pressionado")
            } label: {
                HStack {
                    Image(systemName: "cart")
                    
                    Text("Adicionar ao carrinho")
                        .padding(.horizontal, 32)
                        .padding(.vertical, 16)
                        .font(.title3)
                        .bold()
                        .background(Color("ColorRed"))
                        .foregroundColor(.white)
                        .cornerRadius(32)
                        .shadow(color: Color("RedDark").opacity(0.5), radius: 10, x: 6, y: 8)
                }
            }
        }
    }
}

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView(product: storesMock[0].products[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
