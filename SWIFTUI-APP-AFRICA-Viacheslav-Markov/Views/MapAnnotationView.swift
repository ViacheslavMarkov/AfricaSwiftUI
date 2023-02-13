//
//  MapAnnotationView.swift
//  SWIFTUI-APP-AFRICA-Viacheslav-Markov
//
//  Created by Viacheslav Markov on 09.02.2023.
//

import SwiftUI

struct MapAnnotationView: View {
    //MARK: Properties
    let location: LocationModel
    @State private var animation: Double = 0.0
    
    //MARK: Body
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.accentColor)
                .frame(width: 54, height: 54, alignment: .center)
            
            Circle()
                .stroke(Color.accentColor)
                .frame(width: 52, height: 52, alignment: .center)
                .scaleEffect(1 + CGFloat(animation / 2))
                .opacity(1 - animation)
            
            Image(location.image)
                .resizable()
                .scaledToFit()
                .frame(width: 48, height: 48, alignment: .center)
            .clipShape(Circle())
        }//: ZStack
        .onAppear {
            withAnimation(.easeOut(duration: 2).repeatForever(autoreverses: false)) {
                animation = 1
            }
        }
    }
}

struct MapAnnotationView_Previews: PreviewProvider {
    static let locations: [LocationModel] = Bundle.main.decodeJSON("locations.json")
    
    static var previews: some View {
        MapAnnotationView(location: locations[1])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
