//
//  ResponseObject.swift
//  RickAndMorty
//
//  Created by Анна on 18.07.2024.
//

import Foundation

struct ResponseObject: Codable {
    let info: InfoCharacterResponseObject
    let results: [CharacterResponseObject]
    
    enum CodingKeys: CodingKey {
        case info
        case results
    }
}
