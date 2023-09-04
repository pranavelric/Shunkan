//
//  Grids.swift
//  Shunkan
//
//  Created by Pranav Choudhary on 04/09/23.
//

import SwiftUI

struct Grids: View {
    @Binding var selectedTab:Int
    @Binding var gridSize: Int
    var body: some View {
        
        


                TabView(selection: $selectedTab){
                    LazyGrid(gridSize: $gridSize).tag(0)
                    LazyGrid(gridSize: $gridSize).tag(1)
                    LazyGrid(gridSize: $gridSize).tag(2)
                    
                }
                .tabViewStyle(.page(indexDisplayMode: .never))
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .never))
                
    }
}

struct Grids_Previews: PreviewProvider {
    static var previews: some View {
        Grids(selectedTab: .constant(0),gridSize: .constant(10))
    }
}
