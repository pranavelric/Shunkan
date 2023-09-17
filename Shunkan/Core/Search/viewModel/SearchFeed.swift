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
    
    
    ///MARK:- read local json file store data in userprofile object
    @MainActor
    func loadData() async throws {
//        let url = "https://picsum.photos/v2/list?page=2&limit=60"
//
//        let session = URLSession(configuration: .default)
//        session.dataTask(with: URL.init(string: url)!) { data, response, error in
//
//            if error != nil{
//                print(error?.localizedDescription ?? "")
//            }
//            guard let json = data else{return}
//
//            let jsonValue = try? JSONDecoder().decode([Card].self, from: json)
//            guard let cards = jsonValue else{return}
//            DispatchQueue.main.async {
//                self.cards =  cards
//                self.setCompositionalLayout()
//            }
//
//        }.resume()

        post = Post.MOCK_Posts
        try await self.setCompositionalLayout()
    }
    
    func setCompositionalLayout() async throws{
        var compositionalArr : [Post] = []
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
