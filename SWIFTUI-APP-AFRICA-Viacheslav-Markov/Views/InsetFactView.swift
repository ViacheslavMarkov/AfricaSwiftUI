//
//  InsetFactView.swift
//  SWIFTUI-APP-AFRICA-Viacheslav-Markov
//
//  Created by Viacheslav Markov on 08.02.2023.
//

import SwiftUI

struct InsetFactView: View {
    //MARK: Properties
    let animal: AnimalModel
    
    //MARK: Body
    var body: some View {
        GroupBox {
            TabView {
                ForEach(animal.fact, id: \.self) { item in
                    Text(item)
                }
            }//: Tabs
            .tabViewStyle(PageTabViewStyle())
            .frame(minHeight: 148, idealHeight: 168, maxHeight: 180)
        }//: Box
    }
}

struct InsetFactView_Previews: PreviewProvider {
    static let animalsModels: [AnimalModel] = Bundle.main.decodeJSON("animals.json")
    
    static var previews: some View {
        InsetFactView(animal: animalsModels[4])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
