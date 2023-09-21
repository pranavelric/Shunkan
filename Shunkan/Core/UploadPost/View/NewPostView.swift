//
//  NewPostView.swift
//  Shunkan
//
//  Created by Pranav Choudhary on 10/09/23.
//

import SwiftUI

struct NewPostView: View {
//    let image: UIImage?
    @State private var caption  = ""
    @State private var boostPost: Bool = false
    @StateObject var viewModel: UploadPostViewModel
    @State var displaySheet: Bool = false
    @Binding var tabIndex: Int
    
    
    @State var showError = false
    @State var errorMsg: String? = nil
    @State private var showSheet:Bool = false
    
    var body: some View {

            VStack{
                // action toolbar
                if viewModel.isUploadingPost {
                    Spacer()
                    ProgressView {

                                    Text("Uploading...")
                                        .foregroundColor(.pink)
                                        .bold()
                        
                    }.padding(.bottom,50)
                    
                    
                    Image("upload_post")
                        .resizable()
                        .scaledToFit()
                }
                else{
                HStack{
                    Button {
                       clearPostDataAndReturnToFeed()
                        
                    } label: {
                        Text("cancel")
                    }
                    Spacer()
                    Text("New Post")
                    Spacer()
                    Button {
                        Task{
                            
                            
                            withAnimation {
                                viewModel.isUploadingPost = true
                            }

                            // Perform the task (creating a user in this case)
                            do {
                                
                                try await viewModel.uploadPost(caption:caption)
                                try 
                                clearPostDataAndReturnToFeed()
                                
                            } catch {
                                // Handle any errors that occur during user creation
                                showError = true
                                errorMsg = error.localizedDescription
                                print("Error uploading post: \(error)")
                            }

                            // Hide the ProgressView after the task is completed
                            withAnimation {
                                viewModel.isUploadingPost = false
                            }
                            
                            
                        
                        }
                    } label: {
                        Text("Share")
                    }
                    .alert(isPresented: $showError){
                       Alert(title: Text("Failed to post"), message: Text("\(errorMsg ?? "")"), dismissButton: .default(Text("OK") ))
                   }
                }.padding(.horizontal)
                // post section
             
                    
                
                
                HStack(spacing: 8) {
                    if let image = self.viewModel.postImage {
                        Image(uiImage: image)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .scaledToFill()
                            .frame(width: 100, height: 100)
                            .clipped()
                    }else{
                        
                        Image("profile_placeholder")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .scaledToFill()
                            .frame(width: 100, height: 100)
                            .clipped()
                        
                        
                    }
                    TextField("Write a caption ...", text: $caption,axis: .vertical)
                        .lineLimit(3)
                }.padding()
                Divider()
                VStack{
                    // tag section
                    HStack{
                        Text("Tag people")
                            .font(.subheadline)
                        Spacer()
                        Image(systemName: "chevron.right")
                            .imageScale(.small)
                    }.padding(.horizontal)
                    Divider()
                    // reminder section
                    HStack{
                        Text("Add reminder")
                            .font(.subheadline)
                        Spacer()
                        Image(systemName: "chevron.right")
                            .imageScale(.small)
                    }.padding(.horizontal)
                    Divider()
                    // location
                    HStack{
                        Text("Add location")
                            .font(.subheadline)
                        Spacer()
                        Image(systemName: "chevron.right")
                            .imageScale(.small)
                    }.padding(.horizontal)
                    Divider()
                    // music
                    VStack{
                        HStack{
                            
                            Text("Add music")
                                .font(.subheadline)
                            Spacer()
                            Image(systemName: "chevron.right")
                                .imageScale(.small)
                            
                        }
                        ScrollView(.horizontal){
                            HStack{
                                Text("\(Image(systemName: "music.note")) Calm down - Selena Gomez.")
                                    .padding(.horizontal,10)
                                    .padding(.vertical,5)
                                    .background(.gray.opacity(0.2))
                                    .cornerRadius(7)
                                Text("\(Image(systemName: "music.note")) Mi Gente – JBalvin (feat. Beyoncé)") .padding(.horizontal,10)
                                    .padding(.vertical,5)
                                    .background(.gray.opacity(0.2))
                                    .cornerRadius(7)
                                
                                Text("\(Image(systemName: "music.note")) Industry Baby – Lil Nas X & Jack Harlow") .padding(.horizontal,10)
                                    .padding(.vertical,5)
                                    .background(.gray.opacity(0.2))
                                    .cornerRadius(7)
                                
                            }
                        }.scrollIndicators(.hidden)
                    }
                    .padding(.horizontal)
                    Divider()
                    // boost post
                    
                    HStack{
                        
                        Toggle("Boost post", isOn: $boostPost)
                        
                    }.padding(.horizontal)
                    
                    Spacer()
                }
    
                }
            }
       
    }
    
    
    func clearPostDataAndReturnToFeed(){
        caption = ""
        viewModel.postImage = nil
        tabIndex = 0
    }
}

struct NewPostView_Previews: PreviewProvider {
    static var previews: some View {
        NewPostView(viewModel: UploadPostViewModel(),tabIndex: .constant(0))
    }
}
