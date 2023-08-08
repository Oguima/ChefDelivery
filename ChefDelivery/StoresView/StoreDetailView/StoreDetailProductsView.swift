//
//  StoreDetailProductsView.swift
//  ChefDelivery
//
//  Created by rafael.guimaraes on 08/08/23.
//

import SwiftUI

struct StoreDetailProductsView: View {
    var products: [ProductType]
    @State private var selectedProduct: ProductType?
    
    var body: some View {
        VStack {
            
            Text("Produtos")
                .font(.title2)
                .bold()
                .padding()
            
            ForEach(products) { product in
                
                /*NavigationLink {
                    ProductDetailView(product: product)
                } label: {
                    
                }*/
                
                Button {
                    //
                    selectedProduct = product
                } label: {
                    StoreDetailProductItemView(product: product)
                }
                //Para abir como modal
                //$ binding, ligacao... passando variavel de estado como paramentro.
                .sheet(item: $selectedProduct) { product in
                    ProductDetailView(product: product)
                }
            }
            
        }
    }
}

struct StoreDetailProductsView_Previews: PreviewProvider {
    static var previews: some View {
        StoreDetailProductsView(products: storesMock[0].products)
    }
}
