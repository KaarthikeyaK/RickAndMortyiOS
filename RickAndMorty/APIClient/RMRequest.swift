//
//  RMRequest.swift
//  RickAndMorty
//
//  Created by KAARTHIKEYA K on 16/02/23.
//

import Foundation

/// Object that represents single API Call
final class RMRequest {
    
    /// API Constants
    private struct Constants {
        static let baseurl = "https://rickandmortyapi.com/api"
    }
    
    /// Desired Endpoint
    private let endpoint: RMEndPoint
    
    /// Path components for API, If any
    private let pathComponents: Set<String>
    
    /// Query Arguments for API, if any
    private let queryParameters: [URLQueryItem]
    
    ///  Constructed url for api request in string format
    private var urlString: String {
        var string = Constants.baseurl
        string += "/"
        string += endpoint.rawValue
        
        if !pathComponents.isEmpty{
            pathComponents.forEach({
                string += "/\($0)"
            })
        }
        
        if !queryParameters.isEmpty{
            string += "?"
            let argumentString = queryParameters.compactMap({
                guard let value = $0.value else {return nil}
                return "\($0.name)=\(value)"
            }).joined(separator: "&")
            
            string += argumentString
        }
        
        return string
    }
    
    ///  Computed and constructed API url
    public var url: URL? {
        return URL(string: urlString)
    }
    
    /// Desired Http method
    public let httpMethod = "GET"

    //MARK: - Public
    
    /// Construct Request
    /// - Parameters:
    ///   - endpoint: Target endpoint
    ///   - pathComponents: Collectoin of path components
    ///   - queryParameters: Collection of query paramteres
    init(endpoint: RMEndPoint, pathComponents: Set<String> = [], queryParameters: [URLQueryItem] = []) {
        self.endpoint = endpoint
        self.pathComponents = pathComponents
        self.queryParameters = queryParameters
    }
}
