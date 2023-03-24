//
//  NetworkResult.swift
//  StarWarsSad
//
//  Created by Pilar García on 23/3/23.
//

import Foundation

struct Success {}

struct ErrorMessage: Decodable {
    var error: Bool
    var reason: String
}

enum NetworkError: LocalizedError {
    /// Invalid request, e.g. invalid URL
    case invalidRequestError(String)
    
    /// Received an invalid response, e.g. non-HTTP result
    case invalidResponse
    
    /// Server-side validation error
    case validationError(String)
    
    /// The server sent data in an unexpected format
    case decodingError(Error)
    
    /// General server-side error. If `retryAfter` is set, the client can send the same request after the given time.
    case serverError(statusCode: Int, reason: String? = nil, retryAfter: String? = nil)
    
    /// Indicates an error on the transport layer, e.g. not being able to connect to the server
    case transportError(Error)
    
    /// Indicates that the request has not been executed because it lacks valid authentication credentials
    case sessionError
    
    var errorDescription: String {
        switch self {
        case .invalidRequestError(let message):
            return "Invalid request: \(message)"
        case .invalidResponse:
            return "Invalid response"
        case .validationError(let reason):
            return "Validation Error: \(reason)"
        case .decodingError:
            return "The server returned data in an unexpected format. Try updating the app."
        case .serverError(let statusCode, let reason, let retryAfter):
            return "Server error with code \(statusCode), " +
                "reason: \(reason ?? "no reason given"), retry after: \(retryAfter ?? "no retry after provided")"
        case .transportError(let error):
            return "Transport error: \(error)"
        case .sessionError:
            return "Session could be expired or credentials were invalid"
        }
    }
}
