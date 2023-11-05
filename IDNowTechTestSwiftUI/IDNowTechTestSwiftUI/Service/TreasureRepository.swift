//
//  TreasureService.swift
//  IDNowTechTestSwiftUI
//
//  Created by user on 03/11/2023.
//

import Foundation
import Combine
class TreasureService {
    let session = URLSession.shared
    func fetchTreasure() -> AnyPublisher<TreasureResponse, Error> {
        guard let url = Constants.shared.url as? URL else {
            return Fail(error: URLError(.unsupportedURL)).eraseToAnyPublisher()
        }

        return session.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: TreasureResponse.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}

