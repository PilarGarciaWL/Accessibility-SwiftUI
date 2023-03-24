//
//  Router.swift
//  StarWarsSad
//
//  Created by Pilar García on 23/3/23.
//

import Foundation

enum NetworkRouter {
    case Planets
    case Spaceships
    case Vehicles
    case People
    case Films
    case Species
    
    
    var baseURL: String { return "https://swapi.dev/api/" }
    
    var path: String {
        switch self {
        case .Planets:
            return "planets/"
        case .Spaceships:
            return "spaceships/"
        case .Vehicles:
            return "vehicles/"
        case .People:
            return "people/"
        case .Films:
            return "films/"
        case .Species:
            return "species"
        }
    }
    
    var method: HTTPMethod {
        return .get
    }
    
    var headerParams: [String: String] {
        return ["Content-Type" : "application/json; charset=utf-8"]
    }
    
    var queryParams: [String: Any] {
        return ["":""]
    }
}

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case patch = "PATCH"
    case delete = "DELETE"
}

