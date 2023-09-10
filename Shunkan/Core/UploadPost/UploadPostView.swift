//
//  UploadPostView.swift
//  Shunkan
//
//  Created by Pranav Choudhary on 10/09/23.
//

import SwiftUI
import YPImagePicker
struct UploadPostView: View {

//    @State private var image: UIImage? = nil
    @StateObject var viewModel: UploadPostViewModel = UploadPostViewModel()
    @Binding var tabIndex: Int
    var body: some View {
        NavigationStack{
              
               
           
                Button {
                    viewModel.showMediaPicker = true
                } label: {
                  
                }
                .sheet(isPresented: .constant(tabIndex == 2)) {
                    MediaPicker(image: $viewModel.postImage).interactiveDismissDisabled(true)
                    
                }

            NewPostView(viewModel: viewModel,tabIndex: $tabIndex)

      
        }
    }
}

struct UploadPostView_Previews: PreviewProvider {
    static var previews: some View {
        UploadPostView(tabIndex: .constant(2))
    }
}
