//
//  NetworkingError.swift
//  RickAndMorty
//
//  Created by Анна on 18.07.2024.
//

import Foundation

enum NetWorkingError: Error {
    case networkingError(_ error: Error)
    case unknown
}
