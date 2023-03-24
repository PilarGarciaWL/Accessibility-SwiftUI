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
    
    //public static var splash: Destination = Destination(tag: 0, view: AnyView(SplashRoute()))
    
    //public static var menu: Destination = Destination(tag: 1, view: AnyView(MenuRoute()))
}


public class Destination {
    let tag: Int
    let view: AnyView
    
    init(tag: Int, view: AnyView) {
        self.tag = tag
        self.view = view
    }
}
