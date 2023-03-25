//
//  HomeViewModel.swift
//  StarWarsSad
//
//  Created by Pilar García on 21/3/23.
//

import Combine
import Foundation
import os

class HomeViewModel: ObservableObject  {
    
    @Published var showProgress: Bool = true
    @Published var planet: Planet? = nil
    @Published var films: [Film] = []
    
    private let repository: RepositoryProtocol
    private var disposables = Set<AnyCancellable>()
    private var planets: Planets?
    
    init(repository: RepositoryProtocol) {
        self.repository = repository
        getHomeFeed()
    }
    
    func getHomeFeed() {
        self.showProgress = true
        
        repository.getPlanets()
            .zip(repository.getFilms())
            .receive(on: DispatchQueue.main)
            .sink(
                receiveCompletion: { [weak self] value in
                    self?.showProgress = false
                    switch value {
                    case .failure(let error):
                        Logger.error(error.localizedDescription, type: .network)
                    case .finished:
                        Logger.info("HomeViewModel - getHomeFeed finished", type: .network)
                    }
                },
                receiveValue: { [weak self] planets, films in
                    Logger.success("HomeViewModel - getHomeFeed planets: \(planets)", type: .network)
                    Logger.success("HomeViewModel - getHomeFeed films: \(films)", type: .network)
                    self?.planets = planets
                    self?.planet = planets.items.first
                    self?.films = Array(films.items.prefix(4))
                })
            .store(in: &disposables)
    }
    
    
    //MARK: - Navigation methods
    
    func onMenuClicked() {
        //TODO: Implement this
    }
    
    func onSearchClicked() {
        //TODO: Implement this
    }
    
    func onPlanetReadMoreClicked(_ planet: Planet) {
        //TODO: Implement this
    }
    
    func onStarshipsClicked() {
        //TODO: Implement this
    }
    
    func onSpeciesClicked() {
        //TODO: Implement this
    }
    
    func onFilmItemClick(_ item: Film) {
        
    }
    
    func onViewAllFilmsClicked() {
        //TODO: Implement this
    }
    
}
