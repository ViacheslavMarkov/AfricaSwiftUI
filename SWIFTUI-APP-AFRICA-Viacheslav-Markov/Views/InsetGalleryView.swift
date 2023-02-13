//
//  InsetGalleryView.swift
//  SWIFTUI-APP-AFRICA-Viacheslav-Markov
//
//  Created by Viacheslav Markov on 08.02.2023.
//

import SwiftUI

struct InsetGalleryView: View {
    //MARK: Properties
    let animal: AnimalModel
    
    //MARK: Body
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .center, spacing: 15) {
                ForEach(animal.gallery, id: \.self) { image in
                    Image(image)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 200)
                    .cornerRadius(12)
                }
            }//: HStack
            
        }//: Scroll
        
    }
}

struct InsetGalleryView_Previews: PreviewProvider {
    static var previews: some View {
        let animalsModels: [AnimalModel] = Bundle.main.decodeJSON("animals.json")
        
        InsetGalleryView(animal: animalsModels[3])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
