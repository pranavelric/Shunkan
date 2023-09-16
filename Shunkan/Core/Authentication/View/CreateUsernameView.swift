//
//  CreateUsernameView.swift
//  Shunkan
//
//  Created by Pranav Choudhary on 06/09/23.
//

import SwiftUI

struct CreateUsernameView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel: RegistrationViewModel
    @State private var isShowingAlert = false
    @State private var shouldNavigate = false
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
            TextField("Username", text: $viewModel.username)
                .autocapitalization(.none)
                .modifier(TextFieldModifier())
            
//            NavigationLink{
//                CreatePasswordView().navigationBarBackButtonHidden(true)
//            } label: {
//                Text("Next")
//                         .font(.subheadline)
//                         .fontWeight(.semibold)
//                         .foregroundColor(.white)
//                         .frame(width: 380,height: 44)
//                         .background(.pink)
//                         .cornerRadius(10)
//            }.padding(.vertical)

            
            
            Button(action: {
                           if viewModel.username.isEmpty {
                               isShowingAlert = true
                           } else {
                               shouldNavigate = true
                           }
                       }) {
                           Text("Next")
                               .font(.subheadline)
                               .fontWeight(.semibold)
                               .foregroundColor(.white)
                               .frame(width: 380, height: 44)
                               .background(.pink)
                               .cornerRadius(10)
                       }
                       .padding(.vertical)
                       .alert(isPresented: $isShowingAlert) {
                           Alert(title: Text("Username is empty"), message: Text("Please enter your username."), dismissButton: .default(Text("OK")))
                       }
                       .background(
                           NavigationLink(
                               destination:  CreatePasswordView().navigationBarBackButtonHidden(true),
                               isActive: $shouldNavigate,
                               label: { EmptyView() }
                           )
                       )
            
            
            
            
            
            
            

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
