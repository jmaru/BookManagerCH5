//
//  api.swift
//  BookManagerCH5
//
//  Created by Jorge Gabriel Marin Urias on 1/12/26.
//

func getBooks() -> [Book] {
    return [
        Book(title: "The Fellowship of the Ring", author: "J.R.R. Tolkien", details: "The first book in the LOTR trilogy",cover:"lotr_fellowship", review: "This is the first I read. It ends on a big cliffhanger and I didn't appreciate the LOTR trilogy until I read the two towers", rating: 4, genre: .fantasy),
        Book(title: "The Two Towers", author: "J.R.R. Tolkien", details: "The second book in the LOTR trilogy",cover:"lotr_towers"),
        Book(title: "The Return of the King", author: "J.R.R. Tolkien", details: "The final book in the LOTR trilogy", cover:"lotr_king", genre: .classic, readingStatus: .finished ,isFavorite: true),
    ]
}
