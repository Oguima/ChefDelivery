//
//  StoreDetailHeader.swift
//  ChefDelivery
//
//  Created by rafael.guimaraes on 08/08/23.
//

import SwiftUI

struct StoreDetailHeader: View {
    
    var store: StoreType
    
    var body: some View {
        VStack {
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
        }
    }
}

struct StoreDetailHeader_Previews: PreviewProvider {
    static var previews: some View {
        StoreDetailHeader(store: storesMock[0])
            .previewLayout(.sizeThatFits)
    }
}
