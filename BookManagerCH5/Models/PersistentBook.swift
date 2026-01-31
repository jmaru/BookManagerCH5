//
//  PersistentBook.swift
//  BookManagerCH5
//
//  Created by Jorge Gabriel Marin Urias on 1/26/26.
//

import Foundation
import SwiftData

@Model
class PersistentBook {
    
    var title: String
    var author: String
    var details: String
    var cover: Data?
    
    var review: String
    var rating: Int
    var genre: Genre
    var readingStatus: ReadingStatus
    
    var isFavorite: Bool

    init(
        title: String,
        author: String = "",
        details: String = "",
        cover: Data? = nil,
        review: String = "",
        rating: Int = 0,
        genre: Genre = .unknown,
        readingStatus: ReadingStatus = .unknown,
        isFavorite: Bool = false,
    ){
        self.title = title
        self.author = author
        self.details = details
        self.cover = cover
        self.review = review
        self.rating = rating
        self.genre = genre
        self.readingStatus = readingStatus
        self.isFavorite = isFavorite
    }
}
