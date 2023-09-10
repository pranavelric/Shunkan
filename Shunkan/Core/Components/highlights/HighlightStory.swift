//
//  HighlightStory.swift
//  Shunkan
//
//  Created by Pranav Choudhary on 04/09/23.
//

import SwiftUI
import SDWebImageSwiftUI

struct HighlightStory: View {
    var gradient = Gradient(colors: [.yellow, .red, .purple, .orange, .pink, .red])
//        .overlay(Circle().stroke(LinearGradient( gradient: gradient, startPoint: .bottomLeading, endPoint: .topTrailing) , style: StrokeStyle(lineWidth: 2.5, lineCap: .round)))
    var highlight: Highlight
    var user: User
    var body: some View {
        Button(action: {}) {
            VStack{
                
                AnimatedImage(url:   URL(string: highlight.stories.randomElement()?.imageURL ?? "") )
                        .scaledToFill()
                        .frame(width: 60, height: 60)
                        .clipShape(Circle())
                        .cornerRadius(30)
                        .overlay(
                            RoundedRectangle(cornerRadius: 30)
                                .stroke(Color.gray.opacity(0.4), lineWidth: 2)
                        )
                        
                
                Text(user.username)
                    .foregroundColor(.gray)
                    .font(.system(size: 10))
                    .fontWeight(.regular)
            }
        }.padding(2)
    }
}

struct HighlightStory_Previews: PreviewProvider {
    static var previews: some View {
        HighlightStory(highlight: Highlight.MOCK_Highlights[0],user: User.MOCK_USERS[0])
    }
}
