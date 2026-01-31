//
//  Book.swift
//  BookManagerCH5
//
//  Created by Jorge Gabriel Marin Urias on 1/7/26.
//
import Foundation

struct Book: Hashable {
    let id: UUID = UUID()
    var title: String
    var author: String = ""
    var details: String = ""
    var cover: String = ""
    
    var review: String = ""
    var rating: Int = 0
    var genre: Genre = .unknown
    var readingStatus: ReadingStatus = .unknown
    
    var isFavorite: Bool = false
}

