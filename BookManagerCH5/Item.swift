//
//  Item.swift
//  BookManagerCH5
//
//  Created by Jorge Gabriel Marin Urias on 1/7/26.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
