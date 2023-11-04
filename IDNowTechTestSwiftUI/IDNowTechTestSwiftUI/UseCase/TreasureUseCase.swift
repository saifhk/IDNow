//
//  TreasureService.swift
//  IDNowTechTestSwiftUI
//
//  Created by user on 03/11/2023.
//

import Foundation
import Combine
final class TreasureUseCase {
    private let service: TreasureService
    init(service: TreasureService) {self.service = service}
    
    func fetchTreasure() -> AnyPublisher<TreasureResponse, Error> {
        return service.fetchTreasure()
    }
}
