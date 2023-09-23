//
//  Analytics.swift
//  Shunkan
//
//  Created by Pranav Choudhary on 09/09/23.
//

import Foundation
// Define an AnalyticsEvent model to represent individual events or actions tracked for analytics.
struct AnalyticsEvent {
    var eventID: String
    var eventName: String // A unique name for the event (e.g., "user_login", "post_liked")
    var userID: String // The user associated with the event (if applicable)
    var timestamp: Date // The date and time when the event occurred
    var eventData: [String: Any] // Additional event-specific data as key-value pairs
    
}

// Define an AnalyticsModel to manage and store analytics data.
struct AnalyticsModel {
    var events: [AnalyticsEvent]
    
    init() {
        self.events = []
    }
    
    // Add a function to log events
    mutating func logEvent(event: AnalyticsEvent) {
        events.append(event)
    }
    
    // Add a function to retrieve analytics data for reporting and analysis
    func getAnalyticsData() -> [AnalyticsEvent] {
        return events
    }
}

