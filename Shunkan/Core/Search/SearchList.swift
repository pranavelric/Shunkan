//
//  SearchList.swift
//  Shunkan
//
//  Created by Pranav Choudhary on 06/09/23.
//

import SwiftUI

struct SearchList: View {
    @State private var searchableText = ""
    var body: some View {
        NavigationView {
            ScrollView{
                LazyVStack(spacing:12) {
                    ForEach(0 ... 15, id: \.self){ user in
                        HStack{
                            Image("profile_placeholder")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 40,height: 40)
                                .clipShape(Circle())
                            
                            VStack(alignment: .leading){
                                Text("Pranav Elric")
                                    .fontWeight(.semibold)
                                Text("Pranav Choudhary")
                                    
                            }.font(.footnote)
                            Spacer()
                        }.padding(.horizontal)
                        
                    }
                }.padding(.top,8)
                    .searchable(text: $searchableText, prompt: "Search...")
            }
        }
    }
}

struct SearchList_Previews: PreviewProvider {
    static var previews: some View {
        SearchList()
    }
}
