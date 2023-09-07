//
//  CreateUsernameView.swift
//  Shunkan
//
//  Created by Pranav Choudhary on 06/09/23.
//

import SwiftUI

struct CreateUsernameView: View {
    @State private var username:String = ""
    @Environment(\.dismiss) var dismiss
    var body: some View {
        VStack{
            Text("Create username")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.top)
            Text("Pick a username for your new account. You can always change it later")
                .font(.footnote)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding(.top,1)
                .padding(.bottom,10)
                .padding(.horizontal,24)
            TextField("Username", text: $username)
                .autocapitalization(.none)
                .modifier(TextFieldModifier())
            
            NavigationLink{
                CreatePasswordView().navigationBarBackButtonHidden(true)
            } label: {
                Text("Next")
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

struct CreateUsernameView_Previews: PreviewProvider {
    static var previews: some View {
        CreateUsernameView()
    }
}
