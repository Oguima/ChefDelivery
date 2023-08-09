//
//  ProductDetailQuantityView.swift
//  ChefDelivery
//
//  Created by rafael.guimaraes on 08/08/23.
//

import SwiftUI

struct ProductDetailQuantityView: View {
    //@State var productQuantity : Int //comportamento private ...
    @Binding var productQuantity : Int //comportamento private ...
    
    var body: some View {
        VStack (spacing: 16) {
            Text("Quantidade")
                .bold()
                .font(.title3)
            
            HStack {
                Button {
                    //print ("desce")
                    if (productQuantity > 1) {
                        productQuantity -= 1
                    }
                } label: {
                    Image(systemName: "minus.circle.fill")
                        .font(.title)
                        .bold()
                }
                
                //Para alterar este texto... @state.
                //view vai recarregar
                Text("\(productQuantity)")
                    .font(.title2)
                    .bold()
                
                Button {
                    //print ("Sobe")
                    productQuantity += 1
                } label: {
                    Image(systemName: "plus.circle.fill")
                        .font(.title)
                        .bold()
                }
            }
        }
    }
}

struct ProductDetailQuantityView_Previews: PreviewProvider {
    static var previews: some View {
        //ProductDetailQuantityView(productQuantity: 1)
        ProductDetailQuantityView(productQuantity: .constant(1)) //Para poder passar no bind....
    }
}
