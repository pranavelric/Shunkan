//
//  Highlight.swift
//  Shunkan
//
//  Created by Pranav Choudhary on 09/09/23.
//

import Foundation

struct Highlight :  Codable, Identifiable, Hashable{
    var  id: String
    var title: String // The title of the highlight
    var stories: [Story] // The stories included in the highlight

}



// Create mock data for the Highlight model
extension Highlight {
    static var MOCK_Highlights: [Highlight] = [
        Highlight(id: "1", title: "Summer Adventures", stories: Story.MOCK_Stories),
        Highlight(id: "2", title: "Foodie Finds", stories: Story.MOCK_Stories),
        // Add more mock highlights as needed
    ]
}
