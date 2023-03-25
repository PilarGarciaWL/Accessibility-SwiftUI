//
//  CharactersDTO.swift
//  StarWarsSad
//
//  Created by Pilar García on 25/3/23.
//

import Foundation

struct CharactersDTO: Codable {
    let count: Int
    let next: String?
    let previous: String?
    let results: [CharacterDTO]
    
    enum CodingKeys: String, CodingKey {
        case count = "count"
        case next = "next"
        case previous = "previous"
        case results = "results"
    }
}

struct CharacterDTO: Codable {
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
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case birthYear = "birth_year"
        case eyeColor = "eye_color"
        case gender = "gender"
        case hairColor = "hair_color"
        case height = "height"
        case mass = "mass"
        case skinColor = "skin_color"
        case homeworld = "homeworld"
        case films = "films"
        case species = "species"
        case starships = "starships"
        case vehicles = "vehicles"
    }
}
