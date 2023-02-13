//
//  AnimalGridItemView.swift
//  SWIFTUI-APP-AFRICA-Viacheslav-Markov
//
//  Created by Viacheslav Markov on 10.02.2023.
//

import SwiftUI

struct AnimalGridItemView: View {
    //MARK: Properties
    let animal: AnimalModel
    
    //MARK: Body
    var body: some View {
        Image(animal.image)
            .resizable()
            .scaledToFit()
            .cornerRadius(12)
    }
}

struct AnimalGridItemView_Previews: PreviewProvider {
    static let animalModels: [AnimalModel] = Bundle.main.decodeJSON("animals.json")
    
    static var previews: some View {
        AnimalGridItemView(animal: animalModels[5])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
