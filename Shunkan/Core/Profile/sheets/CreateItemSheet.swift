//
//  CreateItemSheet.swift
//  Shunkan
//
//  Created by Pranav Choudhary on 21/09/23.
//

import SwiftUI

struct CreateItemSheet: View {
    var body: some View {
        List{
            
            ForEach(Sheet.SETTINGS_SHEET_ITEMS){ item in
                
                
    
                    SheetItem(imageName: item.imageName ?? "", itemName: item.itemName)
                    
                
                
            }
                
 
            
              
            
            
        }
        .listStyle(.plain)
        .listRowSeparator(.visible)
            .padding(.vertical)
            
    }
}

#Preview {
    CreateItemSheet()
}
