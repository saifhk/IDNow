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
    
//    func fetchTreasure<T: Codable>() async throws -> T {
//        guard let url = URL(string: "http://localhost:3000/startHunt") else {
//            throw NSError(domain: "Invalid URL", code: 0, userInfo: nil)
//        }
//        let (data, _) = try await URLSession.shared.data(from: url)
//        return try JSONDecoder().decode(T.self, from: data)
//    }
}
enum DataError : Error{
    case urlError
    case DecdodingError
    case statusNotOk
    case successLoading
}



