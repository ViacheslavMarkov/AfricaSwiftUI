//
//  GalleryView.swift
//  SWIFTUI-APP-AFRICA-Viacheslav-Markov
//
//  Created by Viacheslav Markov on 03.02.2023.
//

import SwiftUI

struct GalleryView: View {
    //MARK: Properties
    let animalModels: [AnimalModel] = Bundle.main.decodeJSON("animals.json")
    @State private var selectedAnimal: String = "lion"
    
    //let gridLayout: [GridItem] = [
    //        GridItem(.flexible()),
    //        GridItem(.flexible()),
    //        GridItem(.flexible()),
    //        GridItem(.flexible())
    //    ]
    
//    var gridLayout: [GridItem] = Array.init(repeating: GridItem(.flexible()), count: 3)
    
    @State private var gridLayout: [GridItem] = [GridItem(.flexible())]
    @State private var gridColumn: Double = 3.0
    
    let hapticImpact = UIImpactFeedbackGenerator(style: .medium)
    
    func gridSwitch() {
        gridLayout = Array.init(repeating: .init(.flexible()), count: Int(gridColumn))
    }
    
    //MARK: Body
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            //MARK: Grid
            
            VStack(alignment: .center, spacing: 30) {
                //MARK: Image
                Image(selectedAnimal)
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .overlay(Circle().stroke(.white, lineWidth: 8))
                
                //MARK: Slider
                Slider(value: $gridColumn, in: 2...4, step: 1)
                    .padding(.horizontal)
                    .onChange(of: gridColumn) { newValue in
                        gridSwitch()
                        hapticImpact.impactOccurred()
                    }
                
                //MARK: Grid
                LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                    ForEach(animalModels) { item in
                        Image(item.image)
                            .resizable()
                            .scaledToFit()
                            .clipShape(Circle())
                            .overlay(Circle().stroke(.white, lineWidth: 1))
                            .onTapGesture {
                                selectedAnimal = item.image
                            }
                    }//: Loop
                }//: Grid
                .animation(.easeIn)
                .onAppear {
                    gridSwitch()
                }
            }//: VStack
            .padding(.horizontal, 10)
            .padding(.vertical, 50)
        }//: Scroll
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(MotionAnimationView())
    }
}

struct GalleryView_Previews: PreviewProvider {
    static var previews: some View {
        GalleryView()
    }
}
