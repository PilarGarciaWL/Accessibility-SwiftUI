//
//  Films.swift
//  StarWarsSad
//
//  Created by Pilar García on 24/3/23.
//

import Foundation

struct Films: Codable {
    let count: Int
    let nextPageUrl: String?
    let previousPageUrl: String?
    let items: [Film]
}

struct Film: Codable {
    let title: String
    let episodeID: Int
    let openingCrawl: String
    let director: String
    let producer: String
    let releaseDate: String
    let species: [String]
    let starships: [String]
    let vehicles: [String]
    let characters: [String]
    let planets: [String]
}
