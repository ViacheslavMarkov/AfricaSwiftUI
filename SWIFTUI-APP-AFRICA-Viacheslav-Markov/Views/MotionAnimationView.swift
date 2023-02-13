//
//  MotionAnimationView.swift
//  SWIFTUI-APP-AFRICA-Viacheslav-Markov
//
//  Created by Viacheslav Markov on 09.02.2023.
//

import SwiftUI

struct MotionAnimationView: View {
    //MARK: Properties
    @State private var circleNumber = Int.random(in: 12...16)
    @State private var isAnimating: Bool = false
    
    //MARK: Functions
    
    // 1 random coordinate
    func randomCoordinate(max: CGFloat) -> CGFloat {
        return CGFloat.random(in: 0...max)
    }
    
    // 2 random size
    func randomSize() -> CGFloat {
        return CGFloat.random(in: 10...300)
    }
    
    // 3 random scale
    func randomScale() -> CGFloat {
        return CGFloat.random(in: 0.1...2.0)
    }
    
    // 4 random speed
    func randomSpeed() -> Double {
        return Double.random(in: 0.025...1.0)
    }
    
    // 5 random delay
    func randomDelay() -> Double {
        return Double.random(in: 0...2.0)
    }
    
    //MARK: Body
    var body: some View {
        GeometryReader { geometri in
            ZStack {
                ForEach(0...circleNumber, id: \.self) { item in
                    Circle()
                        .foregroundColor(.gray)
                        .opacity(0.15)
                        .frame(
                            width: randomSize(),
                            height: randomSize(),
                            alignment: .center
                        )
                        .scaleEffect(isAnimating ? randomScale() : 1)
                        .position(
                            x: randomCoordinate(max: geometri.size.width) ,
                            y: randomCoordinate(max: geometri.size.height)
                        )
                        .animation(
                            Animation.interpolatingSpring(stiffness: 0.5, damping: 0.5)
                                .repeatForever()
                                .speed(randomSpeed())
                                .delay(randomDelay())
                        )
                        .onAppear {
                            isAnimating = true
                        }
                }//: Loop
            }//: ZStack
            .drawingGroup()
        }//: Geometri
    }
}

struct MotionAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        MotionAnimationView()
    }
}
