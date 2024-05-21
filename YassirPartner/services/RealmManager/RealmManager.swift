//
//  RealmManager.swift
//  YassirPartner
//
//  Created by macbook  on 19/5/2024.
//

import Foundation
import RealmSwift

class RealmManager: ObservableObject {
    static var shared = RealmManager()
    
    private(set) var realm: Realm?
    
    @MainActor
    func initialize() async {
        do {
            guard var flexSyncConfig = app.currentUser?.flexibleSyncConfiguration() else { return }
            flexSyncConfig.schemaVersion = 0
            flexSyncConfig.objectTypes = [Partner.self,Location.self,Mission.self,Taskk.self]
            
            var realm = try await Realm(configuration: flexSyncConfig)
            
            try await realm.setSubscriptions()
            
            print("Successfully opened realm: \(realm)")
    
            
            self.realm = realm
            
        } catch {
            print("failed to open realm: \(error.localizedDescription)")
        }
    }
    
    
    @MainActor
    func write<Result>(_ block: (() throws -> Result)) throws {
        
        if let realm = self.realm {
            try realm.write(block)
        }
    }
    
    @MainActor
    func add(_ object: Object) {
        if let realm = self.realm {
            realm.add(object)
        }
    }
    
    @MainActor
    func delete(_ object: Object) {
        if let realm = self.realm {
            realm.delete(object)
        }
    }

}
