//
//  HighlightStory.swift
//  Shunkan
//
//  Created by Pranav Choudhary on 04/09/23.
//

import SwiftUI

struct HighlightStory: View {
    var body: some View {
        Button(action: {}) {
            VStack{
                Image("profile_placeholder")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 60, height: 60)
                    .clipShape(Circle())
                    .cornerRadius(30)
                    .overlay(
                        RoundedRectangle(cornerRadius: 30)
                            .stroke(Color.gray.opacity(0.4), lineWidth: 2)
                    )
                    .padding([.top, .horizontal], 5)
                
                Text("pranav.elric")
                    .foregroundColor(.gray)
                    .font(.system(size: 10))
                    .fontWeight(.regular)
            }
        }.padding(2)
    }
}

struct HighlightStory_Previews: PreviewProvider {
    static var previews: some View {
        HighlightStory()
    }
}
