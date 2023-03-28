//
//  Service.swift
//  StarWarsSad
//
//  Created by Pilar García on 23/3/23.
//

import Combine
import Foundation

protocol ServiceProtocol {
    func getPlanets() -> AnyPublisher<Planets, Error>
    func getFilms() -> AnyPublisher<Films, Error>
    func getCharacter(from url: String) -> AnyPublisher<Character, Error>
}

public final class Service: ServiceProtocol {
    
    private let httpAgent = HTTPAgent()
    
    func getPlanets() -> AnyPublisher<Planets, Error> {
        return httpAgent.run(NetworkRouter.Planets)
            .decode(type: PlanetsDTO.self, decoder: JSONDecoder())
            .map { $0.toModel() }
            .eraseToAnyPublisher()
    }
    
    func getFilms() -> AnyPublisher<Films, Error> {
        return httpAgent.run(NetworkRouter.Films)
            .decode(type: FilmsDTO.self, decoder: JSONDecoder())
            .map { $0.toModel() }
            .eraseToAnyPublisher()
    }
    
    func getCharacter(from url: String) -> AnyPublisher<Character, Error> {
        return httpAgent.run(NetworkRouter.character(url: url))
            .decode(type: CharacterDTO.self, decoder: JSONDecoder())
            .map { $0.toModel() }
            .eraseToAnyPublisher()
    }
    
}
