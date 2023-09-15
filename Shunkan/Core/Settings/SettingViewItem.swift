//
//  SettingViewItem.swift
//  Shunkan
//
//  Created by Pranav Choudhary on 15/09/23.
//

import SwiftUI

struct SettingViewItem: View {
    let itemName:String
    let imageName:String?
    let subtitle:String?
    let heading:String?
    let info: String?
    let dividerSize: CGFloat?
    var body: some View {
        HStack{
            Button{
                
            } label: {
                VStack{
                    //heading
                    if heading != nil{
                        Text(heading ?? "").font(.title2).bold().padding().frame(width: UIScreen.main.bounds.width,alignment: .leading)
                            .foregroundColor(.gray)
                    }

                    HStack{
                        VStack{
                            Label("\(itemName)", systemImage: imageName ?? "").font(.headline).frame(width:  UIScreen.main.bounds.width - 100,alignment:  .leading)
                            Label("\(subtitle ?? "")",systemImage: "").font(.footnote).frame(width:  UIScreen.main.bounds.width - 100,alignment:  .leading)
                                .padding(-7).foregroundColor(.gray)
                        }
                        
                        Spacer()
                        Image(systemName: "chevron.right")
                    }.padding(.horizontal)
                   
                    //info
                    if info != nil{
                        Label(info ?? "",systemImage: "").font(.footnote).padding().frame(width: UIScreen.main.bounds.width,alignment: .leading)
                            .foregroundColor(.gray)
                    }
                    if dividerSize != nil{
                        Divider().frame(height: dividerSize).overlay(.gray.opacity(0.3))
                            .padding(.top,20)
                    }
                }.frame(width: UIScreen.main.bounds.width,alignment: .leading)
                    .foregroundColor(.black)
                
            }
            
        }
    }
}

struct SettingViewItem_Previews: PreviewProvider {
    static var previews: some View {
        SettingViewItem(itemName: "Accounts Center", imageName: "person.circle", subtitle: "Password, security, personal details, ads",heading: "Your account", info: "Manage your connected experience and account settings across Shunkan technologies", dividerSize: 5)
    }
}
