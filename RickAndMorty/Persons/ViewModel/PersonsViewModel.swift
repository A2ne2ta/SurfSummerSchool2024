//
//  PersonsViewModel.swift
//  RickAndMorty
//
//  Created by Анна on 18.07.2024.
//

import Foundation


protocol PersonsViewModelProtocol {
    var reloadData: (() -> Void)? { get set }
    var showError: ((String) -> Void)? { get set }
    
    var numberOfCells: Int { get }
    
    func loadData()
    func getCharacter(for row: Int) -> CharacterCellViewModel
}

final class PersonsViewModel: PersonsViewModelProtocol {
    var reloadData: (() -> Void)?
    var showError: ((String) -> Void)?
    
    //MARK: - Properties
    var numberOfCells: Int {
        characters.count
    }
    private var characters: [CharacterResponseObject] = [] {
        didSet {
            DispatchQueue.main.async {
                self.reloadData?()
            }
        }
    }
    
    private var page = 0
    
    //MARK: - Methods
    func getCharacter(for row: Int) -> CharacterCellViewModel {
        let character = characters[row]
        return CharacterCellViewModel(character: character)
    }
    
    func loadData() {
        page += 1
        
        ApiManager.getCharacter(page: page) { [weak self] result in
            switch result {
            case .success(let characters):
                self?.convertToCellViewModel(characters)
            case .failure(let error):
                DispatchQueue.main.async {
                    print(error)
                    self?.showError?(error.localizedDescription)
                }
            }
        }
    }
    
    private func convertToCellViewModel(_ characters: [CharacterResponseObject]) {
        self.characters += characters
    }
    
    private func setupMockObjects() {
//        characters = [ CharacterResponseObject(name: "First Karl", image: URL(string: "https://rickandmortyapi.com/api/character/avatar/1.jpeg")!, status: .Alive, species: "Human", gender: "Male", episode: [URL(string: "https://rickandmortyapi.com/api/character/avatar/1.jpeg")!], location: CharacterLocation(name: "Earth")),
//                       CharacterResponseObject(name: "First Karl", image: URL(string: "https://rickandmortyapi.com/api/character/avatar/1.jpeg")!, status: .alive, species: "Human", gender: "Male", episode: [URL(string: "https://rickandmortyapi.com/api/character/avatar/1.jpeg")!], location: CharacterLocation(name: "Earth")),
//                       CharacterResponseObject(name: "Second Karl", image: URL(string: "https://rickandmortyapi.com/api/character/avatar/1.jpeg")!, status: .alive, species: "Human", gender: "Male", episode: [URL(string: "https://rickandmortyapi.com/api/character/avatar/1.jpeg")!], location: CharacterLocation(name: "Earth"))
//        ]
    }
}
