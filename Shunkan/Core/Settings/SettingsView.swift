//
//  Settings.swift
//  Shunkan
//
//  Created by Pranav Choudhary on 15/09/23.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        
        ScrollView{
            
            ForEach(Sheet.SETTINGS_VIEW_ITEMS){item in
                SettingViewItem(itemName: item.itemName, imageName: item.imageName, subtitle: item.subtitle, heading: item.heading, info: item.info, dividerSize: item.dividerSize)
            }
            
         
                Button{
                    AuthSerivce.shared.signOut()
                } label: {
                    HStack{
                        Text("Log out")
                            .font(.subheadline)
                        Spacer()
                        Image(systemName: "chevron.right")
                            .imageScale(.small)
                    }.padding(.horizontal)
                }.padding(.top)
                .foregroundColor(.red)
                
            
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
