//
//  CharacterCellViewModel.swift
//  RickAndMorty
//
//  Created by Анна on 18.07.2024.
//

import Foundation

struct CharacterCellViewModel {
    let name: String
    let status: CharacterStatus
    let species: String
    let gender: String
    let episode: [URL]
    let location: CharacterLocation
    let image: URL
    
    init(character: CharacterResponseObject) {
        name = character.name
        status = character.status
        species = character.species
        gender = character.gender
        episode = character.episode
        location = character.location
        image = character.image
    }
}
