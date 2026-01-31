//
//  ImagePicker.swift
//  BookManagerCH5
//
//  Created by Jorge Gabriel Marin Urias on 1/28/26.
//

import SwiftUI
import PhotosUI
import SwiftData

struct ImagePicker: View {
    
    @Binding var image: UIImage?
    @State private var photosPickerItem: PhotosPickerItem?
    
    var body: some View {
        PhotosPicker(
            selection: $photosPickerItem,
            matching: .images,
            photoLibrary: .shared()
        ) {
            Image(uiImage: image ?? UIImage(resource: .defaultBookCover))
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 100, height: 100)
        }
        .onChange(of: photosPickerItem) {
            Task {
                if let photosPickerItem,
                   let imageData = try? await photosPickerItem.loadTransferable(type: Data.self){
                   if let image = UIImage(data: imageData) {
                       self.image = image
                   }
                }
            }
        }
    }
}
