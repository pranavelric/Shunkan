//
//  HeaderTabBar.swift
//  Shunkan
//
//  Created by Pranav Choudhary on 04/09/23.
//

import SwiftUI

struct HeaderTabBar: View {
    
    @Binding var selectedTab: Int
    
    
    var body: some View {

     GeometryReader{proxy -> AnyView in
        return AnyView(
            HStack(spacing:0){
                
                TabbarButton(image: "square.grid.2x2", isSystemImage: true ,index: 0,selectedTabIndex: $selectedTab) {
                    selectedTab = 0
                }
                TabbarButton(image: "bookmark.fill", isSystemImage: true,index: 1,selectedTabIndex: $selectedTab) {
                    selectedTab = 1
                }
                TabbarButton(image: "person.crop.square", isSystemImage: true,index:2,selectedTabIndex: $selectedTab) {
                    selectedTab = 2
                }
                
            }.frame( height: 45,alignment: .bottom)
                .padding(0)
        )
        
    }.frame( height: 45)
    }
    
    
    
    
    //Tabbar View Designable
    struct TabbarButton:View{
        
        var image:String
        var isSystemImage:Bool
        var index:Int
        @Binding var selectedTabIndex:Int
        var action: (() -> Void)?
        var body: some View{
            Button(action: {
                
                selectedTabIndex = index
                action?()
            }) {
                VStack(spacing:12){
                    (
                        isSystemImage ? Image(systemName: image) : Image(image)
                    ).renderingMode(.template)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 25, height: 25)
                        .foregroundColor(selectedTabIndex == index ? .primary : .gray)
                    ZStack{
                        if selectedTabIndex == index{
                            Rectangle()
                                .fill(Color.primary)
                        }else{
                            Rectangle()
                                .fill(Color.clear)
                        }
                    }.frame( height: 1)
                }
            }
            
        }
    }
    
    
    
    
}

struct HeaderTabBar_Previews: PreviewProvider {
    static var previews: some View {
        HeaderTabBar(selectedTab: .constant(0))
    }
}
