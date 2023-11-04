//
//  UseCase.swift
//  IDNowTechTest
//
//  Created by user on 01/11/2023.
//

import Foundation
import Combine
class TreasureUseCase {
    static let shared = TreasureUseCase()
    private let treasureRepository = TreasureRepository.shared
    func fetchTreasure<T: Codable>() async throws -> T {
       
        return try await treasureRepository.fetchTreasure()
    }
}


