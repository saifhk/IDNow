//
//  DataService.swift
//  IDNowTechTest
//
//  Created by user on 01/11/2023.
//

import Foundation

class TreasureService : DataServiceDelegate{
    static let shared = TreasureService()
    let session = URLSession.shared
    func fetchTreasure<T: Codable>(from endpoint: URL) async throws -> T  {
        guard let url = endpoint as? URL else {
            throw DataError.urlError
        }
        let (data, response) = try await session.data(from: url)
        guard
          let httpResponse = response as? HTTPURLResponse,
          httpResponse.statusCode == 200
        else {
          throw DataError.statusNotOk
        }
        guard let decodedResponse = try? JSONDecoder().decode(T.self, from: data)
        else { throw DataError.DecdodingError }
        
        return decodedResponse
    }
}
enum DataError : Error{
    case urlError
    case DecdodingError
    case statusNotOk
    case successLoading
}



