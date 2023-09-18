//
//  EditProfileViewModel.swift
//  Shunkan
//
//  Created by Pranav Choudhary on 18/09/23.
//

import Foundation
import SwiftUI
import FirebaseFirestore

@MainActor
class EditProfileViewModel: ObservableObject{
    @Published var user: User
    @Published var profileImage:UIImage?
    @Published var fullname = ""
    @Published var bio = ""
    @Published var biolink = ""
    @Published var isUpdatingUser: Bool = false
    
    init(user: User) {
        self.user = user
    }
    
    func updateUserData() async throws{
        var data = [String: Any]()
        // update profile image if changed
        
        if let profileImage = profileImage{
          var imageUrl =  try await ImageUploader.uploadImage(image: profileImage)
            data["profilePictureURL"] = imageUrl
        }
        
        // update name if changed
        if !fullname.isEmpty && user.fullName != fullname{
            data["fullName"] = fullname
//            user.fullName = fullname
        }
        // update bio if changed
        if !bio.isEmpty && user.bio != bio{
//            user.bio = bio
            data["bio"] = bio
        }
        
        // update biolink if changed
        if !biolink.isEmpty && user.bioLink != biolink{
//            user.bioLink = biolink
            data["bioLink"] = biolink
        }
        
        if !data.isEmpty{
             try await Firestore.firestore().collection("users").document(user.id).updateData(data)
        }
        
    }
}
