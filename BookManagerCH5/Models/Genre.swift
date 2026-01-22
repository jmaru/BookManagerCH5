//
//  Genre.swift
//  BookManagerCH5
//
//  Created by Jorge Gabriel Marin Urias on 1/14/26.
//

enum Genre: String, Codable, CaseIterable {
    case classic = "Classic"
    case fantasy = "Fantasy"
    case scienceFiction = "Science Fiction"
    case horror = "Horror"
    case romance = "Romance"
    case dystopian = "Dystopian"
    // base case
    case unknown = "Unknown"
}
