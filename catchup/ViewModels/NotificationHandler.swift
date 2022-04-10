//
//  Notification Handler.swift
//  catchup
//
//  Created by John Adams on 4/10/22.
//

import Foundation
import UserNotifications

class NotificationHandler: ObservableObject {
    
    @Published var activeNotifications: [personModel : UNNotificationRequest] = [:]
    
    init() {
        
    }
    
    //removes a notification
    func removeNotification(person: personModel) {
        let notif: [String] = [
            activeNotifications[person]!.identifier
            ]
        UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: notif)
        activeNotifications.removeValue(forKey: person)
    }
    
    func recordNotification(person: personModel, notif: UNNotificationRequest) {
        activeNotifications.updateValue(notif, forKey: person)
    }
}
