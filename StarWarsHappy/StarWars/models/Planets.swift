//
//  Planets.swift
//  StarWarsSad
//
//  Created by Pilar García on 24/3/23.
//

import Foundation

struct Planets {
    let count: Int
    let nextPageUrl: String?
    let previousPageUrl: String?
    let items: [Planet]
}

struct Planet {
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
}
