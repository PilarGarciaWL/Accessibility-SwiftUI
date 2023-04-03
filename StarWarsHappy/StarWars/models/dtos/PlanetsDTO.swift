//
//  PlanetsDTO.swift
//  StarWarsSad
//
//  Created by Pilar García on 23/3/23.
//

import Foundation

struct PlanetsDTO: Codable {
    let count: Int
    let next: String?
    let previous: String?
    let results: [PlanetDTO]
    
    enum CodingKeys: String, CodingKey {
        case count = "count"
        case next = "next"
        case previous = "previous"
        case results = "results"
    }
}

struct PlanetDTO: Codable {
    let name: String
    let diameter: String
    let rotationPeriod: String
    let orbitalPeriod: String
    let gravity: String
    let population: String
    let climate: String
    let terrain: String
    let surfaceWater: String
    let residents: [String]
    let films: [String]
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case diameter = "diameter"
        case rotationPeriod = "rotation_period"
        case orbitalPeriod = "orbital_period"
        case gravity = "gravity"
        case population = "population"
        case climate = "climate"
        case terrain = "terrain"
        case surfaceWater = "surface_water"
        case residents = "residents"
        case films = "films"
    }
}
