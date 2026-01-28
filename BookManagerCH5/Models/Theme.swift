//
//  Theme.swift
//  BookManagerCH5
//
//  Created by Jorge Gabriel Marin Urias on 1/26/26.
//
import SwiftUI

enum Theme: String, CaseIterable {
    case light = "Light"
    case dark = "Dark"
    case system = "System"
    
    func colorScheme() -> ColorScheme? {
        switch self {
        case .light:
            return .light
        case .dark:
            return .dark
        case .system:
            return nil
        }
    }
}
