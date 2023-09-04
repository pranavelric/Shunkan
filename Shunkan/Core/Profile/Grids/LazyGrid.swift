//
//  LazyGrid.swift
//  Shunkan
//
//  Created by Pranav Choudhary on 04/09/23.
//

import SwiftUI

struct LazyGrid: View {
    
    @Binding var gridSize: Int
    private let gridItems: [GridItem] = [
        .init(.flexible(),spacing: 1),
        .init(.flexible(),spacing: 1),
        .init(.flexible(),spacing: 1)
    ]

    
    var body: some View {
        
            LazyVGrid(columns: gridItems,spacing: 1){
                ForEach(0 ... gridSize, id: \.self){ index in
                    
                    Image("profile_placeholder")
                        .resizable()
                        .frame(width: UIScreen.main.bounds.width / 3, height: UIScreen.main.bounds.width / 3 )
                        .scaledToFill()
                    
                }
        }
          
            
    }
}

struct LazyGrid_Previews: PreviewProvider {
    static var previews: some View {
        LazyGrid(gridSize: .constant(10))
    }
}
