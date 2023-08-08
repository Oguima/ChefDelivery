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
    
    
    var body: some View {
        ScrollView (showsIndicators: false) {
            VStack(alignment: .leading) {
                StoreDetailHeader(store: store)
                
                StoreDetailProductsView(products: store.products)
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
