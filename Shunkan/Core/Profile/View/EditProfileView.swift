//
//  EditProfileView.swift
//  Shunkan
//
//  Created by Pranav Choudhary on 18/09/23.
//

import SwiftUI
import PhotosUI
import SDWebImageSwiftUI
struct EditProfileView: View {
    @Environment(\.dismiss) var dismiss
    let user:User
//    @StateObject var viewModel = EditProfileViewModel(user: user)
    @StateObject var viewModel: EditProfileViewModel
    init(user:User){
        self.user = user
        self._viewModel = StateObject(wrappedValue: EditProfileViewModel(user: user))
    }
    
    @State var showError = false
    @State var errorMsg: String? = nil
    @State private var showSheet:Bool = false

    
    var body: some View {
        VStack{
            // action toolbar
            if viewModel.isUpdatingUser {
                Spacer()
                ProgressView {

                                Text("Updating...")
                                    .foregroundColor(.pink)
                                    .bold()
                    
                }.padding(.bottom,50)
                
                
                Image("profile_update")
                    .resizable()
                    .scaledToFit()
            }
            else{
            HStack{
                Button {
                   dismiss()
                } label: {
                    Text("cancel")
                }
                Spacer()
                Text("Edit Profile")
                Spacer()
                Button {
                    Task {
                        
                        
                        
                        withAnimation {
                            viewModel.isUpdatingUser = true
                        }

                        // Perform the task (creating a user in this case)
                        do {
                            
                            try await viewModel.updateUserData()
                            // load user data again
                            try await AuthSerivce.shared.loadUserData()
                            dismiss()
                        } catch {
                            // Handle any errors that occur during user creation
                            showError = true
                            errorMsg = error.localizedDescription
                            print("Error creating user: \(error)")
                        }

                        // Hide the ProgressView after the task is completed
                        withAnimation {
                            viewModel.isUpdatingUser = false
                        }
                        
                        
                        
                        
                    }
                } label: {
                    Text("Done")
                } .alert(isPresented: $showError){
                    Alert(title: Text("Failed to update profile"), message: Text("\(errorMsg ?? "")"), dismissButton: .default(Text("OK") ))
                }
            }.padding(.horizontal)
            Divider()
            // post section

                HStack(spacing: 8){
                    
                    Button{
                        showSheet = true
                    } label: {
                        VStack{
                            if let image = self.user.profilePictureURL {
                                if(viewModel.profileImage == nil){
                                    AnimatedImage(url:  URL(string: image) )
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .scaledToFill()
                                        .frame(width: 100, height: 100)
                                        .clipShape(Circle())
                                    .clipped()}
                                else{
                                    Image(uiImage: viewModel.profileImage ?? UIImage(imageLiteralResourceName: "profile_placeholder"))
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .scaledToFill()
                                        .frame(width: 100, height: 100)
                                        .clipShape(Circle())
                                        .clipped()
                                }
                            }else{
                                Image("profile_placeholder")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .scaledToFill()
                                    .frame(width: 100, height: 100)
                                    .clipShape(Circle())
                                    .clipped()
                            }
                            Text("Edid profile picture")
                                .font(.footnote)
                                .fontWeight(.semibold)
                            
                        }
                    }
                    
                    .sheet(isPresented: $showSheet) {
                        
                        MediaPicker(image: $viewModel.profileImage, isCanceled: .constant(false),cropTypeRectangle: false).interactiveDismissDisabled(true)
                        
                    }
                    
                    
                    
                    
                }.padding()
                
                Divider()
                
                
                VStack{
                    // edit name
                    EditProfileViewRow(title: "Name", placeHolder: "\(user.fullName ?? "Enter your full name")", text: $viewModel.fullname)
                    // edit bio
                    
                    EditProfileViewRow(title: "Bio", placeHolder: "\(user.bio ?? "Enter your bio")", text: $viewModel.bio)
                    // edit biolink
                    EditProfileViewRow(title: "Link", placeHolder: "\(user.bioLink ?? "Enter your link")", text: $viewModel.biolink)
                    
                    
                }
            }
            Spacer()
        }
    }
}


struct EditProfileViewRow:View{
    let title:String
    let placeHolder:String
    @Binding var text:String
    
    var body: some View{
        HStack{
            Text(title).padding(.leading, 8)
                .frame(width: 100, alignment: .leading)
            VStack{
                TextField(placeHolder, text: $text)
                
                Divider()
            }
        }.font(.subheadline)
            .frame(height: 36)
    }
}

struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileView(user: User.MOCK_USERS[0])
    }
}
