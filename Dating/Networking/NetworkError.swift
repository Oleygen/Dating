//
//  Networking.swift
//  loc
//
//  Created by oleygen ua on 1/23/19.
//  Copyright © 2019 oleygen. All rights reserved.
//

import Foundation

extension ApplicationError {
    enum Network: Error, Decodable {
        init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            let message = try container.decode(String.self, forKey: .error)
            
            self = Network.messageError(message: message)
        }
        
        case notHTTPResponse
        case noData
        case noErrorData
        case jsonDecodeFailure
        case errorDecodeFailure
        case failedVersionFetch
        case messageError(message: String)
        case error(error: Error)
        
        private enum CodingKeys: String, CodingKey {
            case error
            case message
        }
    }
}

extension ApplicationError.Network : LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .notHTTPResponse:
            return "Not HTTP response"
        case .noData:
            return "No data in response"
        case .noErrorData:
            return "No data for error"
        case .jsonDecodeFailure:
            return "Failure while decoding json"
        case .errorDecodeFailure:
            return "Failure while decoding error"
        case .failedVersionFetch:
            return "Can't fetch shake history versions"
        case .messageError(let message):
            return message
        case .error(let error):
            return error.localizedDescription
        }
    }
}
