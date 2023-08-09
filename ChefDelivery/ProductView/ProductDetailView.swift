//
//  ProductDetailView.swift
//  ChefDelivery
//
//  Created by rafael.guimaraes on 08/08/23.
//

import SwiftUI

struct ProductDetailView: View {
    
    let product: ProductType
    @State private var productQuantity = 1 //comportamento private ...
    
    
    var body: some View {
        VStack {
            ProductDetailHeaderView(product: product)
            
            Spacer()
            
            //ProductDetailQuantityView(productQuantity: productQuantity)
            //Para ser Binding: precisa do $ ...
            ProductDetailQuantityView(productQuantity: $productQuantity)
            
            //Exemplo, para poder alterar o texto, com Binding exemplo
            Text("\(productQuantity) - Binding")
                .font(.title)
                .padding()
            
            Spacer()
            
            //Com o command apertado, foi selecionado Extract View...
            //DICA: Command A + control I, identa
            //Este extraido pode ir para outro arquivo...
            ProductDetailButtonView()
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

struct ProductDetailButtonView: View {
    var body: some View {
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
                    .shadow(color: Color("ColorRedDark").opacity(0.5), radius: 10, x: 6, y: 8)
            }
        }
    }
}
