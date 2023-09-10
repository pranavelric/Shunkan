//
//  UploadPostViewModel.swift
//  Shunkan
//
//  Created by Pranav Choudhary on 10/09/23.
//

import Foundation
import UIKit

@MainActor
class UploadPostViewModel: ObservableObject{
    
    @Published var postImage: UIImage?
}
