//
//  Films.swift
//  StarWarsSad
//
//  Created by Pilar García on 24/3/23.
//

import Foundation

struct Films {
    let count: Int
    let nextPageUrl: String?
    let previousPageUrl: String?
    var items: [Film]
}

struct Film: Hashable {
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
    var rating: String
    var image: String
}
