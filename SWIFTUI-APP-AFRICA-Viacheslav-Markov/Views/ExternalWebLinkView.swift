//
//  ExternalWebLinkView.swift
//  SWIFTUI-APP-AFRICA-Viacheslav-Markov
//
//  Created by Viacheslav Markov on 08.02.2023.
//

import SwiftUI

struct ExternalWebLinkView: View {
    //MARK: Properties
    let animal: AnimalModel
    
    //MARK: Body
    var body: some View {
        GroupBox {
            HStack {
                Image(systemName: "globe")
                Text("Wikipedia")
                Spacer()
                
                Group {
                    Image(systemName: "arrow.up.right.square")
                    
                    Link(animal.name, destination: (URL(string: animal.link) ?? URL(string: "https://wikipedia.org"))!)
                }
                .foregroundColor(.accentColor)
            }//: HStack
        }//: Box
    }
}

struct ExternalWebLinkView_Previews: PreviewProvider {
    static let animalsModels: [AnimalModel] = Bundle.main.decodeJSON("animals.json")
    
    static var previews: some View {
        ExternalWebLinkView(animal: animalsModels[5])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
