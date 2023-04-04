//
//  DTOMappers.swift
//  StarWarsSad
//
//  Created by Pilar García on 24/3/23.
//

import Foundation

extension PlanetsDTO {
    func toModel() -> Planets {
        return Planets(
            count: count,
            nextPageUrl: next,
            previousPageUrl: previous,
            items: results.map { $0.toModel() })
    }
}

extension PlanetDTO {
    func toModel() -> Planet {
        return Planet(
            name: name,
            diameter: diameter,
            rotationPeriod: rotationPeriod,
            orbitalPeriod: orbitalPeriod,
            gravity: gravity,
            population: population,
            climate: climate,
            terrain: terrain,
            surfaceWater: surfaceWater,
            residents: residents,
            films: films
        )
    }
}

extension FilmsDTO {
    func toModel() -> Films {
        return Films(
            count: count,
            nextPageUrl: next,
            previousPageUrl: previous,
            items: results.map { $0.toModel() })
    }
}

extension FilmDTO {
    func toModel() -> Film {
        return Film(
            title: title,
            episodeID: episodeID,
            openingCrawl: openingCrawl,
            director: director,
            producer: producer,
            releaseDate: releaseDate,
            species: species,
            starships: starships,
            vehicles: vehicles,
            characters: characters,
            planets: planets,
            rating: "",
            image: ""
        )
    }
}

extension CharactersDTO {
    func toModel() -> Characters {
        return Characters(
            count: count,
            nextPageUrl: next,
            previousPageUrl: previous,
            items: results.map { $0.toModel() })
    }
}

extension CharacterDTO {
    func toModel() -> Character {
        return Character(
            name: name,
            birthYear: birthYear,
            eyeColor: eyeColor,
            gender: gender,
            hairColor: hairColor,
            height: height,
            mass: mass,
            skinColor: skinColor,
            homeworld: homeworld,
            films: films,
            species: species,
            starships: starships,
            vehicles: vehicles
        )
    }
}
