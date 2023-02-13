//
//  Bundle+Extension.swift
//  SWIFTUI-APP-AFRICA-Viacheslav-Markov
//
//  Created by Viacheslav Markov on 04.02.2023.
//

import Foundation

extension Bundle {
    func decodeJSON<T: Codable>(_ file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Filed to locate \(file) in bundle.")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Filed to load \(file) from bundle.")
        }
        
        let decoder = JSONDecoder()
        
        guard let json = try? decoder.decode(T.self, from: data) else {
            fatalError("Filed to decode \(file) from bundle.")
        }
        
        return json
    }
}
