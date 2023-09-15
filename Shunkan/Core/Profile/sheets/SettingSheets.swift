//
//  SettingSheets.swift
//  Shunkan
//
//  Created by Pranav Choudhary on 14/09/23.
//

import SwiftUI

struct SettingSheets: View {
    var body: some View {
        NavigationView{
            List{
                
                ForEach(Sheet.SETTINGS_SHEET_ITEMS){ item in
                    
                    
                    
                    NavigationLink(destination: item.itemName == "Settings" ? SettingsView() : nil ){
                        SheetItem(imageName: item.imageName ?? "", itemName: item.itemName)
                        
                    }
                    
                }
                
                
            }.listStyle(.plain)
                .listRowSeparator(.hidden)
                
        }
    }
}

struct SettingSheets_Previews: PreviewProvider {
    static var previews: some View {
        SettingSheets()
    }
}
