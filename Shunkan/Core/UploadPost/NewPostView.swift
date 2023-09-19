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
    var body: some View {

            VStack{
                // action toolbar
                HStack{
                    Button {
                        caption = ""
                        viewModel.postImage = nil
                        tabIndex = 0
                        
                    } label: {
                        Text("cancel")
                    }
                    Spacer()
                    Text("New Post")
                    Spacer()
                    Button {
                        
                    } label: {
                        Text("Share")
                    }
                }.padding(.horizontal)
                // post section
                HStack(spacing: 8){
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

struct NewPostView_Previews: PreviewProvider {
    static var previews: some View {
        NewPostView(viewModel: UploadPostViewModel(),tabIndex: .constant(0))
    }
}
