//
//  HomeView.swift
//  ChefDelivery
//
//  Created by rafael.guimaraes on 09/08/23.
//

import SwiftUI

struct HomeView: View {
    
    @State private var isAnimating = false
    @State private var imageOffset: CGSize = .zero //deslocamento da imagem
    @State private var buttonOffset: CGFloat = 0.0 //para o Drag
    @State private var showSecondScreen = false //Se a segunda tela deve ser mostrada
    
    let buttonHeight: CGFloat = 80.0 //Altura botão
    
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                
                //Fica atraz na ZStack
                Circle()
                    .foregroundColor(Color("ColorRed"))
                    .frame(width: isAnimating ? 200: 0)
                    .position(x: isAnimating ? 50: -50 , y: isAnimating ? 100 : -100)
                    .blur(radius: 60)
                    .opacity(isAnimating ? 0.5 : 0)
                
                //GeometryReader
                
                Circle()
                    .foregroundColor(Color("ColorRedDark"))
                    .frame(width: isAnimating ? 200 : 0)
                    .position(
                        x: isAnimating ? geometry.size.width - 50 :  geometry.size.width + 50,
                        y: isAnimating ? geometry.size.height - 50: geometry.size.height + 50)
                    .blur(radius: 60)
                    .opacity(isAnimating ? 0.5 : 0)
                
                VStack {
                    Text("Chef Delivery")
                        .font(.system(size: 48))
                        .fontWeight(.heavy)
                        .foregroundColor(Color("ColorRed"))
                        .opacity(isAnimating ? 1: 0)
                        .offset(y: isAnimating ? 0 : -40)
                    
                    Text("Peça as suas comidas no conforto da sua casa.")
                        .font(.title2)
                        .padding()
                        .multilineTextAlignment(.center)
                        .foregroundColor(.black.opacity(0.7))
                        .opacity(isAnimating ? 1: 0)
                        .offset(y: isAnimating ? 0 : -40)
                    
                    Image("image")
                        .resizable()
                        .scaledToFit()
                        .shadow(radius: 60)
                        .padding(isAnimating ? 32 : 92)
                        .offset(x: imageOffset.width, y: imageOffset.height)
                        .opacity(isAnimating ? 1: 0)
                        .gesture(
                            DragGesture()
                                .onChanged({ gesture in
                                    //print( gesture.translation) //coordenadas do arrasto
                                    withAnimation(.easeInOut(duration: 0.5)) {
                                        imageOffset = gesture.translation
                                    }
                                })
                                .onEnded({ _ in
                                    //print("A interação acabou")
                                    
                                    withAnimation(.easeInOut(duration: 0.5)) {
                                        imageOffset = .zero
                                    }
                                })
                        )
                    
                    //Botão:
                    ZStack {
                        Capsule()
                            .fill(Color("ColorRed").opacity(0.2))
                        
                        //Bordinha
                        Capsule()
                            .fill(Color("ColorRed").opacity(0.2))
                            .padding(8)
                        
                        Text("Descubra mais")
                            .font(.title2)
                            .bold()
                            .foregroundColor(Color("ColorRedDark"))
                            .offset(x: 20)
                        
                        //Capsula que cresce ao arrastar
                        HStack {
                            Capsule()
                                .fill(Color("ColorRed"))
                                .frame(width: buttonOffset + buttonHeight)
                            
                            Spacer()
                        }
                        
                        //Base do botão a arrastar
                        HStack {
                            ZStack {
                                Circle()
                                    .fill(Color("ColorRed"))
                                
                                //Bordinha do botão
                                Circle()
                                    .fill(Color("ColorRedDark"))
                                    .padding(8)
                                
                                Image(systemName: "chevron.right.2")
                                    .font(.system(size:24))
                                    .bold()
                                    .foregroundColor(.white)
                            }
                            
                            Spacer()
                        }
                        .offset(x: buttonOffset)
                        .gesture(
                            DragGesture()
                                .onChanged({ gesture in
                                    
                                    //Verificacao limites...
                                    if gesture.translation.width >= 0  &&
                                        buttonOffset <= (geometry.size.width - 60) - buttonHeight {
                                        
                                        withAnimation(.easeInOut(duration: 0.25)) {
                                            buttonOffset = gesture.translation.width
                                        }
                                    }
                                })
                                .onEnded({ _ in
                                    
                                    //Verificacao...
                                    if buttonOffset > (geometry.size.width - 60) / 2 {
                                        //TODO: Navegar
                                        
                                        showSecondScreen = true
                                    }
                                    else {
                                        //Volta pro 0
                                        withAnimation(.easeInOut(duration: 0.25)) {
                                            buttonOffset = 0
                                        }
                                    }
                                })
                        )
                        
                        
                        
                    }
                    .frame(width: geometry.size.width - 60,
                           height: buttonHeight)
                    .opacity(isAnimating ? 1: 0)
                    .offset(y: isAnimating ? 0: 100) //De baixo pra cima....
                }
                .onAppear {
                    withAnimation(.easeInOut(duration: 1.5)) { //1.5 segundos
                        isAnimating = true
                    }
                }
            }
            .fullScreenCover(isPresented: $showSecondScreen) {
                ContentView()
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
