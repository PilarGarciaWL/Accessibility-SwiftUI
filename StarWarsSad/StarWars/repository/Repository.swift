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
    }
    
    func getCharacter(characterUrl: String) -> AnyPublisher<Character, Error> {
        service.getCharacter(from: characterUrl)
    }
    
}
