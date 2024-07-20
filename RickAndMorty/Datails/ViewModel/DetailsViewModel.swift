//
//  DetailsViewModel.swift
//  RickAndMorty
//
//  Created by Анна on 18.07.2024.
//

import Foundation

protocol DetailsViewModelProtocol {
    var name: String { get }
    var status: CharacterStatus { get }
    var species: String { get }
    var gender: String { get }
    var episode: [URL] { get }
    var location: CharacterLocation { get }
    var image: URL { get }
}

final class DetailsViewModel: DetailsViewModelProtocol {
    let name: String
    let status: CharacterStatus
    let species: String
    let gender: String
    let episode: [URL]
    let location: CharacterLocation
    let image: URL
    
    init(character: CharacterCellViewModel) {
        name = character.name
        status = character.status
        species = character.species
        gender = character.gender
        episode = character.episode
        location = character.location
        image = character.image
    }
}
