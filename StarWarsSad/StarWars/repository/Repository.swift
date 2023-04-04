//
//  Repository.swift
//  StarWarsSad
//
//  Created by Pilar García on 24/3/23.
//

import Combine
import Foundation

protocol RepositoryProtocol {
    func getPlanets() -> AnyPublisher<Planets, Error>
    func getFilms() -> AnyPublisher<Films, Error>
    func getCharacter(characterUrl: String) -> AnyPublisher<Character, Error>
}

public final class Repository: RepositoryProtocol {
    
    private var service: ServiceProtocol
    
    init(service: ServiceProtocol) {
        self.service = service
    }
    
    func getPlanets() -> AnyPublisher<Planets, Error> {
        service.getPlanets()
    }
    
    func getFilms() -> AnyPublisher<Films, Error> {
        service.getFilms()
            .map { it in
                var films = it
                films.items = it.items.map { item in
                    var film = item
                    if item.episodeID == 1 {
                        film.completeTitle = "Episode I: \(item.title)"
                        film.rating = "6.5"
                        film.thumbnail = "img_1"
                        film.image = "img_4-big"
                    } else if item.episodeID == 2 {
                        film.completeTitle = "Episode II: \(item.title)"
                        film.rating = "6.6"
                        film.thumbnail = "img_1"
                        film.image = "img_4-big"
                    } else if item.episodeID == 3 {
                        film.completeTitle = "Episode III: \(item.title)"
                        film.rating = "7.6"
                        film.thumbnail = "img_1"
                        film.image = "img_4-big"
                    } else if item.episodeID == 4 {
                        film.completeTitle = "Episode IV: \(item.title)"
                        film.rating = "8.6"
                        film.thumbnail = "img_4"
                        film.image = "img_4-big"
                    } else if item.episodeID == 5 {
                        film.completeTitle = "Episode V: \(item.title)"
                        film.rating = "8.7"
                        film.thumbnail = "img_5"
                        film.image = "img_4-big"
                    } else if item.episodeID == 6 {
                        film.completeTitle = "Episode VI: \(item.title)"
                        film.rating = "8.3"
                        film.thumbnail = "img_6"
                        film.image = "img_4-big"
                    }
                    return film
                }
                
                return films
            }
            .eraseToAnyPublisher()
    }
    
    func getCharacter(characterUrl: String) -> AnyPublisher<Character, Error> {
        service.getCharacter(from: characterUrl)
    }
    
}
