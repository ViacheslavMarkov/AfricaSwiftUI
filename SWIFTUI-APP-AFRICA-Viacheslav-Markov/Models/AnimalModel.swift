//
//  AnimalModel.swift
//  SWIFTUI-APP-AFRICA-Viacheslav-Markov
//
//  Created by Viacheslav Markov on 04.02.2023.
//

import Foundation

struct AnimalModel: Codable, Identifiable {
    let id          : String
    let name        : String
    let headline    : String
    let description : String
    let link        : String
    let image       : String
    let gallery     : [String]
    let fact        : [String]
    
}
