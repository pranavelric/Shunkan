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
    
    
    //temp
    @State private var redSize: CGSize = .zero
    @State private var yellowSize: CGSize = .zero
    @State private var name: String = ""
    @State private var isCanceled:Bool? = false
    
    var body: some View {
        NavigationStack{
              
   
                                    Button {
                
                                    } label: {
                
                                    }
                                    .sheet(isPresented: .constant(tabIndex == 2 && !isCanceled!)) {
                                        MediaPicker(image: $viewModel.postImage, isCanceled: $isCanceled).interactiveDismissDisabled(true)
                
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
