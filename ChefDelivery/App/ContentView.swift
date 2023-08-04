//
//  ContentView.swift
//  ChefDelivery
//
//  Created by rafael.guimaraes on 03/08/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
           NavigationBar()
                .padding(.horizontal, 15)
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack (spacing: 20) {
                    OrderTypeGridView()
                    CarouselTabView()
                    StoresContainerView()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewLayout(.sizeThatFits) //para ver detalhes do elemento selecionado
    }
}
