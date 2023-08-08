//
//  StoreDetailView.swift
//  ChefDelivery
//
//  Created by rafael.guimaraes on 07/08/23.
//

import SwiftUI

struct StoreDetailView: View {
    let store: StoreType
    
    //Propriedade com infos do ambiente em que a view esta sendo exibida.
    //presentationMode, modo de apresentacao
    @Environment(\.presentationMode) var presentationMode
    @State private var selectedProduct: ProductType?
    
    var body: some View {
        ScrollView (showsIndicators: false) {
            VStack(alignment: .leading) {
                Image(store.headerImage)
                    .resizable()
                    .scaledToFit()
                HStack {
                    Text(store.name)
                        .font(.title)
                        .bold()
                    Spacer()
                    Image(store.logoImage)
                }
                .padding(.vertical, 8)
                .padding(.horizontal)
                
                HStack {
                    Text(store.location)
                    
                    Spacer()
                    
                    //id: \.self (Para identificar cada elemento...
                    ForEach(1...store.stars, id: \.self) { _ in
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                            .font(.caption)
                    }
                }
                .padding(.vertical, 8)
                .padding(.horizontal)
                
                Text("Produtos")
                    .font(.title2)
                    .bold()
                    .padding()
                
                ForEach(store.products) { product in
                    
                    /*NavigationLink {
                        ProductDetailView(product: product)
                    } label: {
                        
                    }*/
                    
                    Button {
                        //
                        selectedProduct = product
                    } label: {
                        HStack(spacing: 8) {
                            VStack (alignment: .leading, spacing: 8) {
                                Text(product.name)
                                    .bold()
                                Text(product.description)
                                    .foregroundColor(.black.opacity(0.5))
                                    .multilineTextAlignment(.leading)
                                
                                //Text("\(product.price)")
                                Text(product.formatedPrice)
                            }
                            
                            Spacer()
                            
                            Image(product.image)
                                .resizable()
                                .scaledToFit()
                                .cornerRadius(12)
                                .frame(width: 120, height: 120)
                                .shadow(color: .black.opacity(0.3), radius: 20, x: 6, y:8)
                        }
                        .padding()
                        .foregroundColor(.black)
                    }
                    //Para abir como modal
                    //$ binding, ligacao... passando variavel de estado como paramentro.
                    .sheet(item: $selectedProduct) { product in
                        ProductDetailView(product: product)
                    }
                }
            }
            .navigationTitle(store.name) //Título da barra de navegacao...
            //.navigationBarTitleDisplayMode(.large)
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden() //Customizar o back
            .toolbar { //Customizando
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        //TODO: Voltar para tela anterior... (Verificar)
                        presentationMode.wrappedValue.dismiss() //Volta para anterior...
                    } label: {
                        HStack (spacing: 4) {
                            Image(systemName: "cart")
                            
                            Text("Lojas")
                        }
                        .foregroundColor(Color("ColorRed"))
                    }
                }
            }
            
        }
    }
        
        
}

struct StoreDetailView_Previews: PreviewProvider {
    static var previews: some View {
        StoreDetailView(store: storesMock[0])
            .previewLayout(.sizeThatFits)
    }
}
