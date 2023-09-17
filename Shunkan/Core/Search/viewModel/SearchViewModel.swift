//
//  SearchViewModel.swift
//  Shunkan
//
//  Created by Pranav Choudhary on 18/09/23.
//

import Foundation

class SearchViewModel: ObservableObject{
    @Published var users = [User]()
    
    init(){
        Task{
            try await  fetchAllUsers()
        }
    }
    
    func fetchAllUsers() async throws{
        let users = try await UserService.FetchAllUsers()
    }
}
