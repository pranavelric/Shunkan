//
//  MessageCellViewModel.swift
//  Shunkan
//
//  Created by Pranav Choudhary on 23/09/23.
//

import Foundation
class MessagesCellViewModel: ObservableObject{
    @Published var isLoading = false
    @Published var user:User?
    
    
    // here userId is of recipient
    init(id:String){
        Task{
            try await getUser(id:id)
        }
    }
    
    @MainActor
    func getUser(id:String) async throws{
        user = try await UserService.fetchUser(withUid: id)

    }
    
    
    
}
