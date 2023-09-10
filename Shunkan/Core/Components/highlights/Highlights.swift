//
//  Highlights.swift
//  Shunkan
//
//  Created by Pranav Choudhary on 04/09/23.
//

import SwiftUI

struct Highlights: View {
    let user:User
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack{
                ForEach(user.highlights) { highlight in
                    HighlightStory(highlight: highlight,user: user)
                }
            }
        }
    }
}

struct Highlights_Previews: PreviewProvider {
    static var previews: some View {
        Highlights(user: User.MOCK_USERS[0])
    }
}
