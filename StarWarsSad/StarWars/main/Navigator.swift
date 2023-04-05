//
//  Navigator.swift
//  StarWarsSad
//
//  Created by Pilar García on 24/3/23.
//

import Foundation
import SwiftUI

public enum Navigator {
    
    public static var composeApp: some View {
        return NavigationView {
            HomeView(repository: repository)
        }
    }
    
    //MARK: - DI
    
    private static let service: ServiceProtocol = Service()
    
    private static let repository: RepositoryProtocol = Repository(service: service)
    
    static func getRepositoryForPreview() -> RepositoryProtocol {
        Repository(service: Service())
    }
    
    //MARK: - Views
    
    static func getView(from destination: Destination) -> AnyView {
        switch destination {
        case .home:
            return AnyView(HomeView(repository: repository))
        case .filmDetail(let film, let chronology):
            return AnyView(FilmDetailView(film: film, chronology: chronology, repository: repository))
        }
    }
}

enum Destination: Hashable {
    case home
    case filmDetail(film: Film, chronology: [Film])
}
