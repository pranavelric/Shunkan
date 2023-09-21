//
//  SheetItem.swift
//  Shunkan
//
//  Created by Pranav Choudhary on 15/09/23.
//

import Foundation
struct Sheet: Identifiable, Hashable ,  Codable{
    var id: String
//    let userID: String
    var itemName: String
    var imageName: String?
    var subtitle:String?
    var heading: String?
    var info:String?
    var dividerSize: CGFloat?

}

extension Sheet{
    
    static var CREATE_ITEM_SHEET_ITEMS: [Sheet] = [
        
        .init(id: "1", itemName:"Reel",imageName:"play.rectangle"),
        .init(id: "2", itemName:"Post",imageName:"rectangle.split.3x3"),
        .init(id: "3", itemName:"Story",imageName:"plus.circle.fill"),
        .init(id: "4", itemName:"Story Highlight",imageName:"heart.circle"),
        .init(id: "5", itemName:"Live",imageName:"dot.radiowaves.left.and.right"),
        .init(id: "6", itemName:"Guide",imageName:"book"),
    ]
    
    static var SETTINGS_SHEET_ITEMS: [Sheet] = [
        
        .init(id: "1", itemName:"Settings",imageName:"circle.grid.hex"),
        .init(id: "2", itemName:"Your activity",imageName:"timer"),
        .init(id: "3", itemName:"Archive",imageName:"arrow.counterclockwise"),
        .init(id: "4", itemName:"QR code",imageName:"qrcode"),
        .init(id: "5", itemName:"Saved",imageName:"bookmark"),
        .init(id: "6", itemName:"Supervision",imageName:"person.2"),
        .init(id: "7", itemName:"Elric Verified",imageName:"star.circle"),
        .init(id: "8", itemName:"Close Friends",imageName:"list.dash"),
        .init(id: "9", itemName:"Favourites",imageName:"star"),
            
    ]
    
    static var SETTINGS_VIEW_ITEMS: [Sheet] = [
        
        .init(id: "1", itemName: "Accounts Center", imageName: "person.circle", subtitle: "Password, security, personal details, ads",heading: "Your account", info: "Manage your connected experience and account settings across Shunkan technologies", dividerSize: 5),
        .init(id: "3", itemName: "notification", imageName: "bell", subtitle: nil ,heading: "How you use Shunkan", info: nil, dividerSize: nil),
        .init(id: "4", itemName: "Time spent", imageName: "clock", subtitle: nil ,heading: nil, info: nil, dividerSize: 10),
        
        
        .init(id: "5", itemName: "Favorites", imageName: "star", subtitle: nil ,heading: "What you see", info: nil, dividerSize: nil),
        .init(id: "6", itemName: "Muted", imageName: "bell.slash", subtitle: nil ,heading: nil, info: nil, dividerSize: nil),
        .init(id: "7", itemName: "Suggested content", imageName: "camera.on.rectangle.fill", subtitle: nil ,heading: nil, info: nil, dividerSize: nil),
        .init(id: "8", itemName: "Like Count", imageName: "heart.slash", subtitle: nil ,heading: nil, info: nil, dividerSize: 5),
        
        
        .init(id: "9", itemName: "Account privacy", imageName: "lock", subtitle: nil ,heading: "Who can see your content", info: nil, dividerSize: nil),
        .init(id: "10", itemName: "Close friends", imageName: "star.circle", subtitle: nil ,heading: nil, info: nil, dividerSize: nil),
        .init(id: "11", itemName: "Blocked", imageName: "slash.circle", subtitle: nil ,heading: nil, info: nil, dividerSize: 5),
            
      
        
        
        .init(id: "12", itemName: "Messages and story replies", imageName: "paperplane", subtitle: nil ,heading: "How others can interact with you", info: nil, dividerSize: nil),
        .init(id: "13", itemName: "Tags and mentions", imageName: "tag.circle", subtitle: nil ,heading: nil, info: nil, dividerSize: nil),
        .init(id: "14", itemName: "Comments", imageName: "message", subtitle: nil ,heading: nil, info: nil, dividerSize: nil),
        .init(id: "15", itemName: "Sharing", imageName: "arrow.2.squarepath", subtitle: nil ,heading: nil, info: nil, dividerSize: nil),
        .init(id: "16", itemName: "Restricted", imageName: "hand.raised.slash", subtitle: nil ,heading: nil, info: nil, dividerSize: nil),
        .init(id: "17", itemName: "Limited interations", imageName: "exclamationmark.bubble", subtitle: nil ,heading: nil, info: nil, dividerSize: nil),
        .init(id: "18", itemName: "Hidden Words", imageName: "textformat", subtitle: nil ,heading: nil, info: nil, dividerSize: nil),
        .init(id: "19", itemName: "Follow and invite friends", imageName: "person.badge.plus", subtitle: nil ,heading: nil, info: nil, dividerSize: 5),
       
            .init(id: "20", itemName: "Archiving and downloading", imageName: "arrow.down.to.line", subtitle: nil ,heading: "Your app and media", info: nil, dividerSize: nil),
            .init(id: "21", itemName: "Accessibility", imageName: "person.crop.circle.badge.checkmark", subtitle: nil ,heading: nil, info: nil, dividerSize: nil),
            .init(id: "22", itemName: "Language", imageName: "signature", subtitle: nil ,heading: nil, info: nil, dividerSize: nil),
            .init(id: "23", itemName: "Data usage", imageName: "icloud.and.arrow.down.fill", subtitle: nil ,heading: nil, info: nil, dividerSize: nil),
            .init(id: "24", itemName: "Website permissions", imageName: "gear", subtitle: nil ,heading: nil, info: nil, dividerSize: 5),
        
        
        
            .init(id: "25", itemName: "Supervision", imageName: "person.2", subtitle: nil ,heading: "For families", info: nil, dividerSize: 5),
        
        
            .init(id: "26", itemName: "Account type and tools", imageName: "hammer", subtitle: nil ,heading: "For professionals", info: nil, dividerSize: 5),
        
        
        .init(id: "27", itemName: "Orders and payment", imageName: "cube.box", subtitle: nil ,heading: "Your orders and fundraisers", info: nil, dividerSize: 5),
        
        
        .init(id: "28", itemName: "Help", imageName: "helm", subtitle: nil ,heading: "More info and support", info: nil, dividerSize: nil),
        .init(id: "29", itemName: "Account status", imageName: "person", subtitle: nil ,heading: nil, info: nil, dividerSize: nil),
        .init(id: "30", itemName: "About", imageName: "info.circle", subtitle: nil ,heading: nil, info: nil, dividerSize: 8),
        
  
    ]
}
