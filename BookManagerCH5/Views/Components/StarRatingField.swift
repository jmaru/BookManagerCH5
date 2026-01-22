//
//  StarRatingField.swift
//  BookManagerCH5
//
//  Created by Jorge Gabriel Marin Urias on 1/14/26.
//

import SwiftUI

struct StarRatingField: View {
    @Binding var rating: Int
    
    var body: some View {
        HStack {
            ForEach(1...5, id: \.self) { star in
                Button(action: {
                    print(star)
                    self.rating = star
                }) {
                    Image(systemName: star <= self.rating ?  "star.fill" : "star")
                        .foregroundColor(.yellow)
                }.buttonStyle(.plain)
            }
        }
    }
}
