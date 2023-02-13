//
//  CoverImageView.swift
//  SWIFTUI-APP-AFRICA-Viacheslav-Markov
//
//  Created by Viacheslav Markov on 04.02.2023.
//

import SwiftUI

struct CoverImageView: View {
    //MARK: Properties
    let coverImageModels: [CoverImageModel] = Bundle.main.decodeJSON("covers.json")
    
    //MARK: Body
    var body: some View {
        TabView {
            ForEach(coverImageModels) { item in
                Image(item.name)
                    .resizable()
                    .scaledToFill()
            }//: Loop
        }//: Tab
        .tabViewStyle(PageTabViewStyle())
    }
}


//MARK: Preview
struct CoverImageView_Previews: PreviewProvider {
    static var previews: some View {
        CoverImageView()
            .previewLayout(.fixed(width: 400, height: 300))
    }
}
