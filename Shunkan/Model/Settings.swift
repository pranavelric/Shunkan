//
//  Settings.swift
//  Shunkan
//
//  Created by Pranav Choudhary on 09/09/23.
//

import Foundation
// Define a Settings model to represent user-specific settings and preferences.
struct Settings {
    var userID: String // The user to whom these settings belong
    var notificationSettings: NotificationSettings
    var privacySettings: PrivacySettings
    var accountPreferences: AccountPreferences
    
    init(userID: String, notificationSettings: NotificationSettings, privacySettings: PrivacySettings, accountPreferences: AccountPreferences) {
        self.userID = userID
        self.notificationSettings = notificationSettings
        self.privacySettings = privacySettings
        self.accountPreferences = accountPreferences
    }
}

// Define submodels for notification settings, privacy settings, and account preferences.

struct NotificationSettings {
    var enablePushNotifications: Bool
    var enableEmailNotifications: Bool
    // Add more notification-related settings as needed
}

struct PrivacySettings {
    var isProfilePublic: Bool
    var allowDirectMessages: Bool
    // Add more privacy-related settings as needed
}

struct AccountPreferences {
    var themeColor: ThemeColor
    // Add more account-related preferences as needed
}

// Define an enum for theme colors.
enum ThemeColor: String {
    case light
    case dark
    case custom
}
