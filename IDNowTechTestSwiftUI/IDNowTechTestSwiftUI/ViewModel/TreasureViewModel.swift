//
//  TreasureViewModel.swift
//  IDNowTechTestSwiftUI
//
//  Created by user on 03/11/2023.
//

import Foundation
import Combine

class TreasureViewModel: ObservableObject {
    @Published var state: TreasureState = .initial
    private let useCase: TreasureUseCase
    private var cancellables = Set<AnyCancellable>()
    init(useCase: TreasureUseCase) {
        self.useCase = useCase
    }

    func fetchTreasure() {
        state = .loading

        useCase.fetchTreasure()
            .receive(on: DispatchQueue.main)
            .sink { completion in
                if case .failure(let error) = completion {
                    self.state = .loadError(error.localizedDescription)
                }
            } receiveValue: { treasure in
                self.state = .loaded(treasure)
            }
            .store(in: &cancellables)
    }
}

enum TreasureState {
    case initial
    case loading
    case loaded(TreasureResponse)
    case loadError(String)
}
