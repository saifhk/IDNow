//
//  TreasureViewModel.swift
//  IDKnowTechTest
//
//  Created by user on 31/10/2023.
//

import Foundation
import Combine

class TreasureViewModel: ObservableObject {
    @Published var state: TreasureState = .initial
    func fetchTreasure() {
        state = .loading
        Task {
            do {
                let treasure: TreasureResponse = try await TreasureUseCase.shared.fetchTreasure()
                state = .loaded(treasure)
            } catch {
                state = .loadError(error.localizedDescription)
            }
        }
    }
}
enum TreasureState {
    case initial
    case loading
    case loaded(TreasureResponse)
    case loadError(String)
   }
