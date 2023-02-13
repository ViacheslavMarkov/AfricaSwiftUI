//
//  AnimalListItemView.swift
//  SWIFTUI-APP-AFRICA-Viacheslav-Markov
//
//  Created by Viacheslav Markov on 04.02.2023.
//

import SwiftUI

struct AnimalListItemView: View {
    //MARK: Properties
    let animal: AnimalModel
    
    //MARK: Body
    var body: some View {
        HStack(alignment: .center, spacing: 16) {
            Image(animal.image)
                .resizable()
                .scaledToFill()
                .frame(width: 90, height: 90)
                .clipShape(
                RoundedRectangle(cornerRadius: 12)
                )
            
            VStack(alignment: .leading, spacing: 8) {
                Text(animal.name)
                    .font(.title2)
                    .fontWeight(.heavy)
                    .foregroundColor(.accentColor)
                
                Text(animal.headline)
                    .font(.footnote)
                    .lineLimit(2)
                    .multilineTextAlignment(.leading)
                    .padding(.trailing, 8)
            }//: VStack
        }//: HStack
    }
}

struct AnimalListItemView_Previews: PreviewProvider {
    static var previews: some View {
        let animalsModels: [AnimalModel] = Bundle.main.decodeJSON("animals.json")
        AnimalListItemView(animal: animalsModels[1])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
