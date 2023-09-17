//
//  SheetItem.swift
//  Shunkan
//
//  Created by Pranav Choudhary on 14/09/23.
//

import SwiftUI

struct SheetItem: View {
    let imageName: String
    let itemName: String
    var body: some View {
        
        VStack{
            Button{
                
            } label: {

                
                Label("\(itemName)", systemImage: imageName).padding(.horizontal)
            }.frame(width: UIScreen.main.bounds.width,alignment: .leading)
                .foregroundColor(.black)

             
        }
    }
}

struct SheetItem_Previews: PreviewProvider {
    static var previews: some View {
        SheetItem(imageName: "music.note", itemName: "Music")
    }
}
