//
//  StoreDetailView.swift
//  ChefDelivery
//
//  Created by rafael.guimaraes on 07/08/23.
//

import SwiftUI

struct StoreDetailView: View {
    let store: StoreType
    
    var body: some View {
        VStack {
            Text("StoredDetailView Screem")
            Text(store.name)
        }
    }
}

struct StoreDetailView_Previews: PreviewProvider {
    static var previews: some View {
        StoreDetailView(store: storesMock[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
