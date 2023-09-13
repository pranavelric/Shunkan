//
//  LoginView.swift
//  Shunkan
//
//  Created by Pranav Choudhary on 06/09/23.
//

import SwiftUI

struct LoginView: View {

    var body: some View {
        NavigationStack{
                  ZStack {
                      Color.gray.opacity(0.1).edgesIgnoringSafeArea(.all)
                      Color("black").edgesIgnoringSafeArea(.all)
                      VStack {
            
                          Spacer()
                          Image("amico3")
                              .resizable()
                              .scaledToFit()
                          Spacer()
                        
                          Text("Get Started")
                                   .font(.title3)
                                   .fontWeight(.bold)
                                   .foregroundColor(.white)
                                   .frame(maxWidth: .infinity)
                                   .padding()
                                   .background(.pink)
                                   .cornerRadius(10)
                          
                          NavigationLink(
                            destination: SignInView().navigationBarBackButtonHidden(true),
                              label: {
                                  Text("Sign In")
                                      .font(.title3)
                                      .fontWeight(.bold)
                                      .foregroundColor(.black)
                                      .padding()
                                      .frame(maxWidth: .infinity)
                                      .background(Color.white)
                                      .cornerRadius(10.0)
                                      .shadow(color: Color.black.opacity(0.08), radius: 60, x: 0.0, y: 16)
                                      .padding(.vertical)
                              })
                              .navigationBarHidden(true)
               

                          HStack {
                              Text("New around here? ")
                          NavigationLink{
                              AddEmailView().navigationBarBackButtonHidden(true)
                          } label: {
                              Text("Sign up").foregroundColor(.pink)
                                     
                              }
                          }
                      }
                      .padding()
                  }
              }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
