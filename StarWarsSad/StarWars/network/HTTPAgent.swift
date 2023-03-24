//
//  HTTPAgent.swift
//  StarWarsSad
//
//  Created by Pilar García on 23/3/23.
//

import Combine
import Foundation
import os

struct HTTPAgent {
    
    func run(_ requestRoute: NetworkRouter, _ decoder: JSONDecoder = JSONDecoder()) -> AnyPublisher<Data, Error> {
                
        guard let url = URL(string: requestRoute.path) else {
            return Fail(error: NetworkError.invalidRequestError("URL invalid")).eraseToAnyPublisher()
        }
        
        //Build request
        var request = URLRequest(url: url)
        
        //set headers
        requestRoute.headerParams.forEach { element in
            request.setValue(element.value, forHTTPHeaderField: element.key)
        }
        
        //set method and body
        guard let httpBody = try? JSONSerialization.data(withJSONObject: requestRoute.queryParams, options: []) else {
            return Fail(error: NetworkError.invalidRequestError("Error parsing post body")).eraseToAnyPublisher()
        }
        request.httpMethod = requestRoute.method.rawValue
        request.httpBody = httpBody
        
        Logger.debug("HTTPAgent - requestRoute path \(requestRoute.path)", type: .network)
        Logger.debug("HTTPAgent - requestRoute method \(requestRoute.method)", type: .network)
        Logger.debug("HTTPAgent - requestRoute queryParams \(requestRoute.queryParams)", type: .network)
        
        return URLSession.shared.dataTaskPublisher(for: request)
            .tryMap { result -> Data in
                Logger.debug("HTTPAgent - result: \(result)", type: .network)
                guard let urlResponse = result.response as? HTTPURLResponse else {
                    throw NetworkError.invalidResponse
                }
                guard (200..<300) ~= urlResponse.statusCode else {
                    if urlResponse.statusCode == 401 {
                        throw NetworkError.sessionError
                    }
                    let apiError = try JSONDecoder().decode(ErrorMessage.self, from: result.data)
                    throw NetworkError.serverError(statusCode: urlResponse.statusCode, reason: apiError.reason)
                }
                Logger.debug("HTTPAgent - \(request) status code: \(urlResponse.statusCode)", type: .network)
                Logger.debug(
                    "HTTPAgent - \(request) response: \(String(data:result.data, encoding:String.Encoding.utf8) ?? "")",
                    type: .network
                )
                return result.data
            }
            .eraseToAnyPublisher()
    }
}
