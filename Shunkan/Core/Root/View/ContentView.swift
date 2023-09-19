//
//  ContentView.swift
//  Shunkan
//
//  Created by Pranav Choudhary on 03/09/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ContentViewModel()
    @StateObject var registationViewModel: RegistrationViewModel = RegistrationViewModel()
    var body: some View {
        GeometryReader{ _ in
            Group{
                
                
                
                
                if viewModel.userSession == nil{
                    LoginView().environmentObject(registationViewModel)
                }else if let currentUser = viewModel.currentUser{
                    MainTabView(user: currentUser)
                }
            }
        }.ignoresSafeArea()

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
