//
//  Layout2.swift
//  Shunkan
//
//  Created by Pranav Choudhary on 05/09/23.
//

import SwiftUI
import SDWebImageSwiftUI

struct Layout2: View {
    var body: some View {
        HStack(spacing: 4){
            AnimatedImage(url: URL(string: "https://e0.pxfuel.com/wallpapers/376/888/desktop-wallpaper-ace-hat-raining-one-piece-ace-one-piece-portrait-thumbnail.jpg" ?? ""))
                .resizable()
                .aspectRatio( contentMode: .fill)
                .frame(width: (UIScreen.main.bounds.width / 3.09), height: (UIScreen.main.bounds.width / 3))
                .cornerRadius(4)
            
            AnimatedImage(url: URL(string: "https://e0.pxfuel.com/wallpapers/376/888/desktop-wallpaper-ace-hat-raining-one-piece-ace-one-piece-portrait-thumbnail.jpg" ?? ""))
                .resizable()
                .aspectRatio( contentMode: .fill)
                .frame(width: (UIScreen.main.bounds.width / 3.09), height: (UIScreen.main.bounds.width / 3))
                .cornerRadius(4)
            
            AnimatedImage(url: URL(string: "https://e0.pxfuel.com/wallpapers/376/888/desktop-wallpaper-ace-hat-raining-one-piece-ace-one-piece-portrait-thumbnail.jpg" ?? ""))
                .resizable()
                .aspectRatio( contentMode: .fill)
                .frame(width: (UIScreen.main.bounds.width / 3.09), height: (UIScreen.main.bounds.width / 3))
                .cornerRadius(4)
        }
    }
}

struct Layout2_Previews: PreviewProvider {
    static var previews: some View {
        Layout2()
    }
}
