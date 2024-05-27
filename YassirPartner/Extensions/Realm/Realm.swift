//
//  Realm.swift
//  YassirRider
//
//  Created by Mac on 10/03/2024.
//

import Foundation
import RealmSwift

extension Realm {
    mutating func setSubscriptions() async throws {
        
        let subscriptions = self.subscriptions
        
        try await subscriptions.update {
            subscriptions.checkAndSet(subKey: "Partner", model: Partner.self)
            subscriptions.checkAndSet(subKey: "Location", model: Location.self)
            subscriptions.checkAndSet(subKey: "Mission", model: Mission.self)
            subscriptions.checkAndSet(subKey: "Taskk", model: Taskk.self)

        }
    }
}
