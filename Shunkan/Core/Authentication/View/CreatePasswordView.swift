//
//  CreatePasswordView.swift
//  Shunkan
//
//  Created by Pranav Choudhary on 06/09/23.
//

import SwiftUI

struct CreatePasswordView: View {

    @State var isSecure: Bool = true
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel: RegistrationViewModel
    @State private var isShowingAlert = false
    @State private var shouldNavigate = false
    var body: some View {
        VStack{
            Text("Create a password")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.top)
            Text("Your passowrd must be at least 6 characters in lenght")
                .font(.footnote)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding(.top,1)
                .padding(.bottom,10)
                .padding(.horizontal,24)

            
            
            ZStack(alignment: .trailing) {
                        Group {
                            if isSecure {
                                SecureField("Enter your password", text: $viewModel.password)
                                    .autocapitalization(.none)
                                    .modifier(TextFieldModifier())

                            } else {
                                TextField("Enter your password", text: $viewModel.password)
                                    .autocapitalization(.none)
                                    .modifier(TextFieldModifier())

                            }
                            Button {
                                isSecure.toggle()
                            } label: {
                                Image(systemName: isSecure ? "eye.slash" : "eye")
                                    .foregroundColor(.black)
                            }.padding(.horizontal,34)
                        }.padding(.top,10)
                       
                    }
            
//            NavigationLink{
//                CompleteSignUp().navigationBarBackButtonHidden(true)
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
                           if viewModel.password.isEmpty {
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
                           Alert(title: Text("Password is empty"), message: Text("Please enter your password."), dismissButton: .default(Text("OK")))
                       }
                       .background(
                           NavigationLink(
                               destination:  CompleteSignUp().navigationBarBackButtonHidden(true),
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

struct CreatePasswordView_Previews: PreviewProvider {
    static var previews: some View {
        CreatePasswordView()
    }
}
