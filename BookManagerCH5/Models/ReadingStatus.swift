//
//  ReadingStatus.swift
//  BookManagerCH5
//
//  Created by Jorge Gabriel Marin Urias on 1/14/26.
//

enum ReadingStatus: String, Codable, CaseIterable {
    case wantToRead = "Want to read"
    case reading = "Reading"
    case dropped = "Dropped"
    case finished = "Finished"
    case unknown = "Unknown"
}
