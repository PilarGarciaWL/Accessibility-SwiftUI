//
//  FilmDetailViewModel.swift
//  StarWarsSad
//
//  Created by Pilar García on 25/3/23.
//

import Combine
import Foundation
import os

class FilmDetailViewModel: ObservableObject  {
    
    @Published var characters : [Character]  = []
    
    var film: Film
    
    private let repository: RepositoryProtocol
    private var disposables = Set<AnyCancellable>()
    
    init(film: Film, repository: RepositoryProtocol) {
        self.film = film
        self.repository = repository
        getCharacters()
    }
    
    func getCharacters() {
        characters = []
        
        for character in film.characters {
            repository.getCharacter(characterUrl: character)
                .receive(on: DispatchQueue.main)
                .sink(
                    receiveCompletion: { value in
                        switch value {
                        case .failure(let error):
                            Logger.error(error.localizedDescription, type: .network)
                        case .finished:
                            Logger.info("FilmDetailViewModel - getCharacter finished", type: .network)
                        }
                    },
                    receiveValue: { [weak self] result in
                        Logger.success("FilmDetailViewModel - getCharacter: \(result)", type: .network)
                        self?.characters.append(result)
                    })
                .store(in: &disposables)
        }
    }
    
}
