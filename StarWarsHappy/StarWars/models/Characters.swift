//
//  Characters.swift
//  StarWarsSad
//
//  Created by Pilar García on 25/3/23.
//

import Foundation

struct Characters: Hashable {
    let count: Int
    let nextPageUrl: String?
    let previousPageUrl: String?
    let items: [Character]
}

struct Character: Hashable {
    let name: String
    let birthYear: String
    let eyeColor: String
    let gender: String
    let hairColor: String
    let height: String
    let mass: String
    let skinColor: String
    let homeworld: String
    let films: [String]
    let species: [String]
    let starships: [String]
    let vehicles: [String]
}
