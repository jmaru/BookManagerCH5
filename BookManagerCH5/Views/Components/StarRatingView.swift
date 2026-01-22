//
//  StarRatingView.swift
//  BookManagerCH5
//
//  Created by Jorge Gabriel Marin Urias on 1/14/26.
//

import SwiftUI

struct StarRatingView: View {
    var rating: Int
    
    var body: some View {
        HStack{
            ForEach(1...5, id: \.self) { star in
                Image(systemName: star <= self.rating ?  "star.fill" : "star")
                    .foregroundColor(.yellow)
            }
        }
        .accessibilityElement(children: .ignore)
        .accessibilityLabel("Star rating: \(self.rating)/5")
    }
}
