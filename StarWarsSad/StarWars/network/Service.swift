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
}

public final class Service: ServiceProtocol {
    
    private let httpAgent = HTTPAgent()
    
    func getPlanets() -> AnyPublisher<Planets, Error> {
        return httpAgent.run(NetworkRouter.Planets)
            .decode(type: PlanetsDTO.self, decoder: JSONDecoder())
            .map { $0.toModel() }
            .eraseToAnyPublisher()
    }
    
    func getFilmography() -> AnyPublisher<Planets, Error> {
        return httpAgent.run(NetworkRouter.Films)
            .decode(type: PlanetsDTO.self, decoder: JSONDecoder())
            .map { $0.toModel() }
            .eraseToAnyPublisher()
    }
    
}
