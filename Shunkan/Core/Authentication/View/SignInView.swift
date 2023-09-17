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
    @State var showError = false
    @State var errorMsg: String? = nil
    @State var shouldNavigate: Bool = false
    @StateObject var viewModel: LoginViewModel = LoginViewModel()
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
                    TextField("Enter your email", text: $viewModel.email)
                        .autocapitalization(.none)
                        .modifier(TextFieldModifier())

                    
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
                    Task{
                        
                        
                        // Show the ProgressView
                              withAnimation {
                                  viewModel.isLogginIn = true
                              }

                              // Perform the task (creating a user in this case)
                              do {
                                  try await viewModel.signIn()
                                  viewModel.email    = ""
                                  viewModel.password = ""
                              } catch {
                                  // Handle any errors that occur during user creation
                                  showError = true
                                  errorMsg = error.localizedDescription
                                  print("Error creating user: \(error)")
                              }

                              // Hide the ProgressView after the task is completed
                              withAnimation {
                                  viewModel.isLogginIn = false
                              }
                        
                        
                     
                        try await viewModel.signIn()
                    }
                  
                } label: {
                    
                    if viewModel.isLogginIn {
                                       ProgressView("Loading...")
                    } else {
                        Text("Login")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .frame(width: 380,height: 44)
                            .background(Color(.systemPink))
                            .cornerRadius(8)
                    }
                }.padding(.vertical)
                    .alert(isPresented: $showError){
                        Alert(title: Text("Failed to SignIn"), message: Text("\(errorMsg ?? "")"), dismissButton: .default(Text("OK")))
                    }
                
                
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
