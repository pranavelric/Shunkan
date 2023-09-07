//
//  CompleteSignUp.swift
//  Shunkan
//
//  Created by Pranav Choudhary on 07/09/23.
//

import SwiftUI

struct CompleteSignUp: View {
    @State private var password:String = ""
    @State var isSecure: Bool = true
    @Environment(\.dismiss) var dismiss
    var body: some View {
        VStack{
            Spacer()
            Text("Welcome to Shunkan, Pranav Elric")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.top)
            Text("Click blow to complete registration and start using Shunkan")
                .font(.footnote)
                .multilineTextAlignment(.center)
                .padding(.top,1)
                .padding(.bottom,10)
                .padding(.horizontal,24)

            
  
            
            Button{
                
            } label: {
                Text("Complete Sign Up")
                         .font(.subheadline)
                         .fontWeight(.semibold)
                         .foregroundColor(.white)
                         .frame(width: 380,height: 44)
                         .background(.pink)
                         .cornerRadius(10)
            }.padding(.vertical)

            

            Spacer()
        }
        .toolbar{
            ToolbarItem(placement: .navigationBarLeading) {
                Image(systemName: "chevron.left")
                    .imageScale(.large)
                    .onTapGesture {
                        dismiss()
                    }
            }
        }
    }
}

struct CompleteSignUp_Previews: PreviewProvider {
    static var previews: some View {
        CompleteSignUp()
    }
}
