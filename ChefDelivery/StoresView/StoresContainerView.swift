//
//  StoresContainerView.swift
//  ChefDelivery
//
//  Created by rafael.guimaraes on 03/08/23.
//

import SwiftUI

struct StoresContainerView: View {
    let title = "Lojas"
    
    var body: some View {
        VStack (alignment: .leading) {
            Text(title)
                .font(.headline)
            
            VStack(alignment: .leading, spacing: 30) {
                ForEach(storesMock) { mock in
                    //Cria o link para transicao de telas...
                    NavigationLink{
                        StoreDetailView(store: mock)
                    } label: {
                        StoreItemView(order: mock)
                    }
                }
            }
            .foregroundColor(.black)
        }
        .padding(.horizontal, 20)
    }
}

struct StoresContainerView_Previews: PreviewProvider {
    static var previews: some View {
        StoresContainerView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
