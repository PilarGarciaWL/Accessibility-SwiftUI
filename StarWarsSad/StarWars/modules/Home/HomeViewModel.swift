//
//  HomeViewModel.swift
//  StarWarsSad
//
//  Created by Pilar García on 21/3/23.
//

import Combine
import Foundation
import os
import SwiftUI

class HomeViewModel: ObservableObject  {
    
    @Published var showProgress: Bool = true
    @Published var planet: Planet? = nil
    @Published var filmography: [Film] = []
    @Published var navigationPath: [Destination] = []
    
    @Published var viewToNavigate: AnyView = AnyView(EmptyView())
    @Published var doNavigate: Bool = false
    
    private let repository: RepositoryProtocol
    private var disposables = Set<AnyCancellable>()
    private var planets: Planets?
    private var films: [Film] = []
    
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
                    self?.films = films.items.sorted { $0.episodeID < $1.episodeID }
                    self?.filmography = Array(films.items.sorted { $0.episodeID < $1.episodeID }.prefix(4))
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
        var chronology: [Film] = []
        if let index: Int = films.firstIndex(where: { $0.episodeID == item.episodeID }) {
            if index+1 < films.count {
                chronology = Array(films[index+1...(films.count-1)])
            }
        }
        viewToNavigate = Navigator.getView(from: .filmDetail(film: item, chronology: chronology))
        doNavigate =  true
    }
    
    func onViewAllFilmsClicked() {
        //TODO: Implement this
    }
    
}
