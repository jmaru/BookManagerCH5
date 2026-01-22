//
//  FilterView.swift
//  BookManagerCH5
//
//  Created by Jorge Gabriel Marin Urias on 1/21/26.
//

import SwiftUI

struct FilterView: View {
    
    @Binding var selectedGenre: Genre?
    @Binding var selectedReadingStatus: ReadingStatus?
    
    var body: some View {
        NavigationStack{
            Form{
                Section(header: Text("Select a genre")){
                    Picker("Genre", selection: $selectedGenre){
                        Text("Select a genre...").tag(nil as Genre?)
                        ForEach(Genre.allCases, id: \.self) { genre in
                            Text(genre.rawValue).tag(genre)
                        }
                    }
                }
                Section(header: Text("Select a reading status")){
                    Picker("Reading Status", selection: $selectedReadingStatus){
                        Text("Select a status...").tag(nil as ReadingStatus?)
                        ForEach(ReadingStatus.allCases, id: \.self) { status in
                            Text(status.rawValue).tag(status)
                        }
                    }
                }
            }
            .navigationTitle("Filter favorite books")
        }
    }
}
