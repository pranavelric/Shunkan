//
//  SearchView.swift
//  Shunkan
//
//  Created by Pranav Choudhary on 05/09/23.
//

import SwiftUI
import SDWebImageSwiftUI
struct SearchView: View {
    @State var search: String = ""
    @State var text: String = ""
  
    
    var body: some View {
        NavigationView{
            VStack{
              
          

             
                                  
                                if false{
                                    ProgressView().frame(maxWidth: .infinity, maxHeight: .infinity)
                                }else{
                                    ScrollView{
                                        VStack(spacing: 4){
                                            ForEach(0 ... 10,id: \.self){ index in
                
                
                                                if index == 0 || index % 6 == 0 {
                                                    Layout1()
                                                }else if index % 3 == 0{
                                                    Layout3()
                                                }else{
                //                                    Layout2(cards: viewModel.compositionalArray[index])
                                                    Layout2()
                                                }
                
                
                                            }
                
                                        }
                                    }
                                }
                
                
                
                
       
                
            }
            
            //        .navigationTitle("")
            //                    .navigationBarHidden(true)
            
            
//            .navigationTitle("ddd-").navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(
                              trailing:
                                 Text("")
            )
            .navigationSearchBar(text: $text,

                                 options: [
                                    .automaticallyShowsSearchBar: true,
                                    .obscuresBackgroundDuringPresentation: true,
                                    .hidesNavigationBarDuringPresentation: true,
                                    .hidesSearchBarWhenScrolling: true,
                                    .placeholder: "Search",
                                    .showsBookmarkButton: true,
                                 ],
                                 actions: [
                                    .onCancelButtonClicked: {
                                        print("Cancel")
                                    },
                                    .onSearchButtonClicked: {
                                        print("Search")
                                    }
                                 ], searchResultsContent: {
                                  SearchList()

                                 })
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
