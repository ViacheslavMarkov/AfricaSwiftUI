//
//  ContentView.swift
//  SWIFTUI-APP-AFRICA-Viacheslav-Markov
//
//  Created by Viacheslav Markov on 03.02.2023.
//

import SwiftUI

struct ContentView: View {
    //MARK: Properties
    let animalsModels: [AnimalModel] = Bundle.main.decodeJSON("animals.json")
    let hapticImpact = UIImpactFeedbackGenerator(style: .medium)
    
    @State private var isGridViewActive: Bool = false
    
    @State private var gridLayout: [GridItem] = [GridItem(.flexible())]
    @State private var gridColumn: Int = 1
    @State private var toolBatImage: String = "square.grid.2x2"
    
    //MARK: Function
    
    func switchGrid() {
        gridLayout = Array.init(repeating: GridItem(.flexible()), count: gridLayout.count % 3 + 1)
        gridColumn = gridLayout.count
         
        switch gridColumn {
        case 1:
            toolBatImage = "square.grid.2x2"
        case 2:
            toolBatImage = "square.grid.3x2"
        case 3:
            toolBatImage = "rectangle.grid.1x2"
        default:
            toolBatImage = "square.grid.2x2"
        }
    }
    
    //MARK: Body
    var body: some View {
        NavigationView {
            Group {
                if !isGridViewActive {
                    List {
                        CoverImageView()
                            .frame(height: 300)
                            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                        
                        ForEach(animalsModels) { model in
                            NavigationLink(destination: AnimalDetailView(animal: model)) {
                                AnimalListItemView(animal: model)
                            }//: Link
                        }//: Loop
                        
                        CreditsView()
                            .modifier(CentreModifier())
                    }//: List
                } else {
                    ScrollView {
                        LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10, content: {
                            ForEach(animalsModels) { model in
                                NavigationLink(destination: AnimalDetailView(animal: model)) {
                                    AnimalGridItemView(animal: model)
                                }//: Link
                            }//: ForEach
                        })
                        .padding(10)
                        .animation(.easeIn)
                    }//: Scroll
                }//: Conditional
            }//: Group
            .navigationBarTitle("Africa", displayMode: .large)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack(spacing: 16) {
                        // List
                        Button(action: {
                            isGridViewActive = false
                            hapticImpact.impactOccurred()
                            print("List view is activated")
                        }) {
                            Image(systemName: "square.fill.text.grid.1x2")
                                .font(.title2)
                                .foregroundColor(isGridViewActive ? .primary : .accentColor)
                        }
                        
                        // Grid
                        Button {
                            isGridViewActive = true
                            hapticImpact.impactOccurred()
                            switchGrid()
                            print("Grid view is activated")
                        } label: {
                            Image(systemName: toolBatImage)
                                .font(.title2)
                                .foregroundColor(isGridViewActive ? .accentColor : .primary)
                        }
                        
                    }//: HStack
                }//: ToolbarItem
            }//: Toolbar
        }//: Navigation
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
