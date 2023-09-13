//
//  SignInView.swift
//  Shunkan
//
//  Created by Pranav Choudhary on 06/09/23.
//

import SwiftUI

struct SignInView: View {
    @State private var email:String = ""
    @State private var password:String = ""
    @State var isSecure: Bool = true
    @Environment(\.dismiss) var dismiss
    var body: some View {
            VStack{
                Spacer()
                // logo image
                Image("font_white_bg")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 220,height: 100)
                
                // text fields
                VStack{
                    TextField("Enter your email", text: $email)
                        .autocapitalization(.none)
                        .modifier(TextFieldModifier())

                    
                    ZStack(alignment: .trailing) {
                                Group {
                                    if isSecure {
                                        SecureField("Enter your password", text: $password)
                                            .autocapitalization(.none)
                                            .modifier(TextFieldModifier())

                                    } else {
                                       TextField("Enter your password", text: $password)
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
                }
                Button{
                    print("forgot pass")
                } label: {
                    Text("Forgot Passwrod?")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .padding(.top)
                        .padding(.trailing,28)
                        
                    
                }.frame(maxWidth: .infinity,alignment: .trailing)
                
                Button{
                    print("login")
                } label: {
                    Text("Login")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(width: 380,height: 44)
                        .background(Color(.systemPink))
                        .cornerRadius(8)
                }.padding(.vertical)
                
                
                HStack{
                    Rectangle().frame(width: (UIScreen.main.bounds.width / 2) - 40, height: 0.5)
                    Text("OR")
                        .font(.footnote)
                        .fontWeight(.semibold)
                    Rectangle().frame(width: (UIScreen.main.bounds.width / 2) - 40, height: 0.5)
                    
                }.foregroundColor(.gray)
                

                
                Spacer()
                HStack {
                    Text("New around here? ")
                NavigationLink{
                    AddEmailView().navigationBarBackButtonHidden(true)
                } label: {
                    Text("Sign up").foregroundColor(.pink)
                           
                    }
                }

        } .toolbar{
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

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
