//
//  SearchFeed.swift
//  Shunkan
//
//  Created by Pranav Choudhary on 11/09/23.
//

import Foundation
class SearchFeedViewModel:ObservableObject{
    
    @Published var post: [Post] = []
    @Published var search: String = ""
    @Published var compositionalArray: [[Post]] = []
    @Published var users = [User]()
    
    init(){
        Task{
            try await loadData()
            try await  fetchAllUsers()
        }
    }
    
    
   
    
    @MainActor
    func fetchAllUsers() async throws{
        self.users = try await UserService.FetchAllUsers()
        
    }
    
    @MainActor
    func loadData() async throws {
        
        self.post = try await PostService.fetchFeedPosts()
        try await self.setCompositionalLayout()
    }
    
    @MainActor
    func setCompositionalLayout() async throws{
        
        var compositionalArr : [Post] = []
        self.compositionalArray = []
        post.forEach { card in
            compositionalArr.append(card)
            if compositionalArray.count % 2 == 0 ||  compositionalArray.count % 3 == 0{
                if compositionalArr.count == 5{
                    
                    print("index :\(compositionalArray.count)")
                    print("elements :\(compositionalArr.count)")
                    compositionalArray.append(compositionalArr)
                    compositionalArr.removeAll()
                    
                }
                
            }else{
                if compositionalArr.count == 3{
                    print("index :\(compositionalArray.count)")
                    print("elements :\(compositionalArr.count)")
                    compositionalArray.append(compositionalArr)
                    compositionalArr.removeAll()
                    
                }
            }
            
            if (compositionalArr.count != 5 || compositionalArr.count != 3 )  && card.id == post.last!.id{
                                compositionalArray.append(compositionalArr)
                                compositionalArr.removeAll()
            }
            
        }
        
    }
    
}
