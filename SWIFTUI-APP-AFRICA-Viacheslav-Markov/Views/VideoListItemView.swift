//
//  VideoListItemView.swift
//  SWIFTUI-APP-AFRICA-Viacheslav-Markov
//
//  Created by Viacheslav Markov on 08.02.2023.
//

import SwiftUI

struct VideoListItemView: View {
    //MARK: Properties
    let video: VideoModel
    
    //MARK: Body
    var body: some View {
        HStack(spacing: 10) {
            ZStack {
                Image(video.thumbnail)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 80)
                    .cornerRadius(8)
                
                Image(systemName: "play.circle")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 32)
                    .shadow(radius: 4)
            }//: ZStack
            
            VStack(alignment: .leading, spacing: 10) {
                Text(video.name)
                    .font(.title2)
                    .foregroundColor(.accentColor)
                    .fontWeight(.heavy)
                
                Text(video.headline)
                    .font(.footnote)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
            }//: VStack
        }//: HStack
    }
}

struct VideoListItemView_Previews: PreviewProvider {
    static let videoModels: [VideoModel] = Bundle.main.decodeJSON("videos.json")
    
    static var previews: some View {
        VideoListItemView(video: videoModels[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
