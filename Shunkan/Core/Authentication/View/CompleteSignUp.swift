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
    @State var showError = false
    @State var errorMsg: String? = nil
    @State var shouldNavigate: Bool = false
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel: RegistrationViewModel

    var body: some View {
        VStack{
            Spacer()
            Text("Welcome to Shunkan, \(viewModel.username)")
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
                Task{
                    
                    // Show the ProgressView
                          withAnimation {
                              viewModel.isCreatingUser = true
                          }

                          // Perform the task (creating a user in this case)
                          do {
                              
                              try await viewModel.createUser()
                          } catch {
                              // Handle any errors that occur during user creation
                              showError = true
                              errorMsg = error.localizedDescription
                              print("Error creating user: \(error)")
                          }

                          // Hide the ProgressView after the task is completed
                          withAnimation {
                              viewModel.isCreatingUser = false
                          }
                }
            } label: {
                if viewModel.isCreatingUser {
                                   ProgressView("Loading...")
                } else {
                    Text("Complete Sign Up")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(width: 380,height: 44)
                        .background(.pink)
                        .cornerRadius(10)
                }
            }.padding(.vertical)
                .alert(isPresented: $showError){
                    Alert(title: Text("Failed to register user"), message: Text("\(errorMsg ?? "")"), dismissButton: .default(Text("OK"), action: {
                        shouldNavigate = true

                        
                    } ))
                }.background(
                    NavigationLink(
                        destination:  LoginView().navigationBarBackButtonHidden(true),
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

struct CompleteSignUp_Previews: PreviewProvider {
    static var previews: some View {
        CompleteSignUp()
    }
}
