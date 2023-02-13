//
//  VideoModel.swift
//  SWIFTUI-APP-AFRICA-Viacheslav-Markov
//
//  Created by Viacheslav Markov on 08.02.2023.
//

import Foundation

struct VideoModel: Identifiable, Codable {
    let id      : String
    let name    : String
    let headline: String
    
    // Computer property
    var thumbnail: String {
        return "video-\(id)"
    }
}
