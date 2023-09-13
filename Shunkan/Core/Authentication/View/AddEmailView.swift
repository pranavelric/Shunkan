//
//  AddEmailView.swift
//  Shunkan
//
//  Created by Pranav Choudhary on 06/09/23.
//

import SwiftUI

struct AddEmailView: View {
//    @State private var email:String = ""
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel: RegistrationViewModel
    var body: some View {
        VStack{
            Text("Add your email")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.top)
            Text("You'll use this email to sign into your account")
                .font(.footnote)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding(.top,1)
                .padding(.bottom,10)
                .padding(.horizontal,24)
            TextField("Enter your email", text: $viewModel.email)
                .autocapitalization(.none)
                .modifier(TextFieldModifier())
            
            NavigationLink{
                CreateUsernameView()
                    .navigationBarBackButtonHidden(true)
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

struct AddEmailView_Previews: PreviewProvider {
    static var previews: some View {
        AddEmailView()
    }
}
