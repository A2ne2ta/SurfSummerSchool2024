//
//  InfoCharacterResponseObject.swift
//  RickAndMorty
//
//  Created by Анна on 18.07.2024.
//

import Foundation

struct InfoCharacterResponseObject: Codable {
    let count: Int
    let pages: Int
    let next: URL?
    let prev: URL?
}
