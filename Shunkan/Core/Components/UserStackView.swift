//
//  UserStackView.swift
//  Shunkan
//
//  Created by Pranav Choudhary on 04/09/23.
//

import SwiftUI

struct UserStackView: View {
    
    let value: Int
    let title: String
    
    var body: some View {
        VStack{
            Text("\(value)")
                .font(.subheadline)
                .fontWeight(.semibold)
            Text(title)
                .font(.footnote)
        }
        .frame(width: 76)
      
    }
}

struct UserStackView_Previews: PreviewProvider {
    static var previews: some View {
        UserStackView(value: 3, title: "Following")
    }
}
