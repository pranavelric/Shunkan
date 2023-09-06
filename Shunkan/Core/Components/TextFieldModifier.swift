//
//  TextFieldModifier.swift
//  Shunkan
//
//  Created by Pranav Choudhary on 06/09/23.
//

import SwiftUI
import Foundation
struct TextFieldModifier: ViewModifier{
    
    func body(content: Content) -> some View {
       content
        .font(.subheadline)
        .padding(12)
        .background(Color(.systemGray6))
        .cornerRadius(10)
        .padding(.horizontal,24)
    }
    
    
}
