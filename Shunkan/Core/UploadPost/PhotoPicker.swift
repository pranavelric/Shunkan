//
//  PhotoPicker.swift
//  Shunkan
//
//  Created by Pranav Choudhary on 10/09/23.
//

import SwiftUI
import YPImagePicker

struct MediaPicker: UIViewControllerRepresentable {
  
    class Coordinator: NSObject, UINavigationControllerDelegate {
        let parent: MediaPicker
        
        init(_ parent: MediaPicker) {
            self.parent = parent
        }
        
        
        
    }

    typealias UIViewControllerType = YPImagePicker
    @Binding var image: UIImage?
    
    func makeUIViewController(context: Context) -> YPImagePicker {
        var config = YPImagePickerConfiguration()
       
        //Common
        config.shouldSaveNewPicturesToAlbum = false
        config.albumName = "Shunkan"
        config.showsPhotoFilters = true
        config.showsCrop = .rectangle(ratio: 1)
        config.screens = [.library,.photo,.video]
        config.startOnScreen = .library
        config.hidesStatusBar = false
        config.hidesBottomBar = false
        config.hidesCancelButton = false
        //library
        config.library.mediaType = .photo
        config.library.maxNumberOfItems = 1
    
        config.wordings.libraryTitle = "Gallery"
        config.library.skipSelectionsGallery = true
        config.targetImageSize = .cappedTo(size: 1080)
        
        let picker = YPImagePicker(configuration: config)
        picker.didFinishPicking { [unowned picker] items, _ in
            if let photo = items.singlePhoto {
                self.image = photo.image
            }
            picker.dismiss(animated: true, completion: nil)
        }
        picker.delegate = context.coordinator
        return picker
    }
    
    func updateUIViewController(_ uiViewController: YPImagePicker, context: Context) {
        
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
}
