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
            return baseURL + "planets/"
        case .Spaceships:
            return baseURL + "spaceships/"
        case .Vehicles:
            return baseURL + "vehicles/"
        case .People:
            return baseURL + "people/"
        case .Films:
            return baseURL + "films/"
        case .Species:
            return baseURL + "species/"
        }
    }
    
    var method: HTTPMethod {
        return .get
    }
    
    var headerParams: [String: String] {
        return ["Content-Type" : "application/json; charset=utf-8"]
    }
}

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case patch = "PATCH"
    case delete = "DELETE"
}

