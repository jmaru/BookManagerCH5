//
//  SettingsView.swift
//  BookManagerCH5
//
//  Created by Jorge Gabriel Marin Urias on 1/26/26.
//

import SwiftUI

struct SettingsView: View {
    
    @AppStorage(SETTING_THEME_KEY) private var currentTheme: Theme = .system
    
    var body: some View {
        NavigationStack{
            Form {
                Section(header: Text("Appearance")) {
                    Picker("Theme", selection: $currentTheme) {
                        ForEach(Theme.allCases, id:\.self) { theme in
                            Text(theme.rawValue).tag(theme)
                        }
                    }
                }
            }
        }
    }
}
