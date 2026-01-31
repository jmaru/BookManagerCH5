//
//  Theme.test.swift
//  BookManagerCH5
//
//  Created by Jorge Gabriel Marin Urias on 1/31/26.
//

import Testing
@testable import BookManagerCH5
internal import SwiftUI

@MainActor @Suite("Theme tests")
struct ThemeTests {
    
    @Test("Theme inits light correctly")
    func themeInitsLightCorrectly(){
        //arrange
        let theme: Theme = .light
        
        //act
        let colorScheme = theme.colorScheme()
        
        //assert
        #expect( colorScheme == .light)
    }
    
    @Test("Theme inits dark correctly")
    func themeInitsDarkCorrectly(){
        //arrange
        let theme: Theme = .dark
        
        //act
        let colorScheme = theme.colorScheme()
        
        //assert
        #expect( colorScheme == .dark)
    }
    
    @Test("Theme inits system correctly")
    func themeInitsSystemCorrectly(){
        //arrange
        let theme: Theme = .system
        
        //act
        let colorScheme = theme.colorScheme()
        
        //assert
        #expect( colorScheme == nil)
    }
    
}
