//
//  ApiManager.swift
//  RickAndMorty
//
//  Created by Анна on 18.07.2024.
//

import Foundation


final class ApiManager {
    private static let baseUrl = "https://rickandmortyapi.com/api/"
    private static let path = "character"
    
    static func getCharacter(page: Int, completion: @escaping (Result<[CharacterResponseObject], Error>) -> ()) {
        let stringUrl = baseUrl + path + "?page=\(page)"
        
        guard let url = URL(string: stringUrl) else { return }
        
        let session = URLSession.shared.dataTask(with: url) { data, response, error in
            handleResponse(data: data, error: error, completion: completion)
        }
        
        session.resume()
    }
    
    private static func handleResponse(data: Data?, error: Error?, completion: @escaping (Result<[CharacterResponseObject], Error>) -> ()) {
        if let error = error {
            completion(.failure(NetWorkingError.networkingError(error)))
        } else if let data = data {
            do {
                let model = try JSONDecoder().decode(ResponseObject.self, from: data)
                completion(.success(model.results))
            }
            catch let decodeError {
                completion(.failure(decodeError))
            }
        } else {
            completion(.failure(NetWorkingError.unknown))
        }
    }
}
