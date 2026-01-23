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
    @Environment(\.dismiss) var dismiss
    
    @State private var workingGenre: Genre?
    @State private var workingReadingStatus: ReadingStatus?
    
    init(selectedGenre: Binding<Genre?>, selectedReadingStatus: Binding<ReadingStatus?>) {
        _selectedGenre = selectedGenre
        _selectedReadingStatus = selectedReadingStatus
        _workingGenre = .init(initialValue: selectedGenre.wrappedValue)
        _workingReadingStatus = .init(initialValue: selectedReadingStatus.wrappedValue)
        
//        _workingBook = .init(initialValue: book.wrappedValue)
    }
    
    var body: some View {
        NavigationStack{
            Form{
                Section(header: Text("Select a genre")){
                    Picker("Genre", selection: $workingGenre){
                        Text("Select a genre...").tag(nil as Genre?)
                        ForEach(Genre.allCases, id: \.self) { genre in
                            Text(genre.rawValue).tag(genre)
                        }
                    }
                }
                Section(header: Text("Select a reading status")){
                    Picker("Reading Status", selection: $workingReadingStatus){
                        Text("Select a status...").tag(nil as ReadingStatus?)
                        ForEach(ReadingStatus.allCases, id: \.self) { status in
                            Text(status.rawValue).tag(status)
                        }
                    }
                }
            }
            .navigationTitle("Filter favorite books")
            .toolbar{
                ToolbarItem(placement: .cancellationAction){
                    Button("Clear"){
                        selectedGenre = nil
                        selectedReadingStatus = nil
                        dismiss()
                    }
                }
                ToolbarItem(placement: .confirmationAction){
                    Button("Apply"){
                        selectedGenre = workingGenre
                        selectedReadingStatus = workingReadingStatus
                        dismiss()
                    }
                }
            }
        }
    }
}
