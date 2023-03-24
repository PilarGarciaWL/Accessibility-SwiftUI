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
    @Published var planets: [Planet] = []
    @Published var films: [Film] = []
    
    private let repository: RepositoryProtocol
    private var disposables = Set<AnyCancellable>()
    
    init(repository: RepositoryProtocol) {
        self.repository = repository
        getPlanets()
        getFilms()
    }
    
    func getPlanets() {
        repository.getPlanets()
            .receive(on: DispatchQueue.main)
            .sink(
                receiveCompletion: { [weak self] value in
                    switch value {
                    case .failure(let error):
                        Logger.error(error.localizedDescription, type: .network)
                    case .finished:
                        self?.showProgress = true
                        Logger.info("HomeViewModel - getPlanets finished", type: .network)
                    }
                },
                receiveValue: { [weak self] result in
                    Logger.success("HomeViewModel - getPlanets event: \(result)", type: .network)
                    self?.planets = result.items
                })
            .store(in: &disposables)
    }
    
    func getFilms() {
        repository.getFilms()
            .receive(on: DispatchQueue.main)
            .sink(
                receiveCompletion: { [weak self] value in
                    switch value {
                    case .failure(let error):
                        Logger.error("HomeViewModel - getFilms error: \(error.localizedDescription)", type: .network)
                    case .finished:
                        self?.showProgress = true
                        Logger.info("HomeViewModel - getFilms finished", type: .network)
                    }
                },
                receiveValue: { [weak self] result in
                    Logger.success("HomeViewModel - getFilms event: \(result)", type: .network)
                    self?.films = result.items
                })
            .store(in: &disposables)
    }
    
}
