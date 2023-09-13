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

        Group{
            
            if viewModel.userSession == nil{
                LoginView().environmentObject(registationViewModel)
            }else{
                MainTabView()
            }
            
        }
         

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
