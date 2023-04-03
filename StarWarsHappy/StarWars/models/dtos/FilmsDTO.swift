//
//  FilmsDTO.swift
//  StarWarsSad
//
//  Created by Pilar García on 24/3/23.
//

import Foundation

struct FilmsDTO: Codable {
    let count: Int
    let next: String?
    let previous: String?
    let results: [FilmDTO]
    
    enum CodingKeys: String, CodingKey {
        case count = "count"
        case next = "next"
        case previous = "previous"
        case results = "results"
    }
}

struct FilmDTO: Codable {
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
    
    enum CodingKeys: String, CodingKey {
        case title = "title"
        case episodeID = "episode_id"
        case openingCrawl = "opening_crawl"
        case director = "director"
        case producer = "producer"
        case releaseDate = "release_date"
        case species = "species"
        case starships = "starships"
        case vehicles = "vehicles"
        case characters = "characters"
        case planets = "planets"
    }
}
