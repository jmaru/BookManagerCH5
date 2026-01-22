//
//  CustomCapsule.swift
//  BookManagerCH5
//
//  Created by Jorge Gabriel Marin Urias on 1/14/26.
//

import SwiftUI

struct CustomCapsule: View {
    let text: String
    var color: Color = .accentColor
    
    var body: some View {
        Text(text)
            .font(.caption)
            .fontWeight(.bold)
            .foregroundColor(.secondary)
            .padding(8)
            .background(color.opacity(0.2))
            .clipShape(Capsule())
    }
}
