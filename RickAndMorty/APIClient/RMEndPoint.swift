//
//  RMEndPoint.swift
//  RickAndMorty
//
//  Created by KAARTHIKEYA K on 16/02/23.
//

import Foundation

/// Represents Unique API Endpoints
@frozen enum RMEndPoint: String {
    /// Endpiont to get character info
    case character // "character"
    /// Endpoint to get Location info
    case location
    /// Enpoint to get Episode info
    case episode
}
