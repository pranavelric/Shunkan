//
//  UploadPostView.swift
//  Shunkan
//
//  Created by Pranav Choudhary on 10/09/23.
//

import SwiftUI
import YPImagePicker
struct UploadPostView: View {
    @State private var showMediaPicker: Bool = true
      @State private var image: UIImage? = nil

    var body: some View {
        NavigationStack{
            ZStack {
                Button {
                    showMediaPicker = true
                } label: {
                    //                   Text("Select Picture")
                }
                .sheet(isPresented: $showMediaPicker) {
                    MediaPicker(image: $image)
                    
                }
                if let image = self.image {
                  NewPostView(image: image)
                }
            }
        }
    }
}

struct UploadPostView_Previews: PreviewProvider {
    static var previews: some View {
        UploadPostView()
    }
}
