//
//  HomeViewModel.swift
//  StarWarsSad
//
//  Created by Pilar García on 21/3/23.
//

import Combine
import Foundation
import os

class CardTestingViewModel: ObservableObject  {
    
    private let repository: RepositoryProtocol
    private var disposables = Set<AnyCancellable>()
    
    init(repository: RepositoryProtocol) {
        self.repository = repository
    }
    
}
