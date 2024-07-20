//
//  CharacterResponseObject.swift
//  RickAndMorty
//
//  Created by Анна on 18.07.2024.
//

import Foundation
import UIKit

enum CharacterStatus: String, Codable {
    case alive = "Alive"
    case dead = "Dead"
    case unknown
    
    var color: UIColor {
        switch self {
        case .alive:
            return UIColor(red: 25/255, green: 135/255, blue: 55/255, alpha: 1)
        case .dead:
            return UIColor(red: 214/255, green: 35/255, blue: 0/255, alpha: 1)
        case .unknown:
            return UIColor(red: 104/255, green: 104/255, blue: 116/255, alpha: 1)
        }
    }
}

struct CharacterResponseObject: Codable {
    let name: String
    let image: URL
    let status: CharacterStatus
    let species: String
    let gender: String
    let episode: [URL]
    let location: CharacterLocation
}

struct CharacterLocation: Codable {
    let name: String
}
