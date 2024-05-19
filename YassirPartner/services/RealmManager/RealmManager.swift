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
            
        } catch {
            print("failed to open realm: \(error.localizedDescription)")
        }
    }
}
