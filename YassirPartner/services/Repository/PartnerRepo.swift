//
//  PartnerRepo.swift
//  YassirPartner
//
//  Created by macbook  on 21/5/2024.
//

import Foundation
import RealmSwift


class PartnerRepo: RealmManager {
    
    static let sharedPartner = PartnerRepo()
    
    @Published private(set) var partner: Partner?
    
    @MainActor
    func createPartner(fullName: String) async throws {
        
        await RealmManager.shared.initialize()
        
        guard let id = app.currentUser?.id else {
            debugPrint("error::creating::partner::no::id::found")
            return
        }
        
        let newPartner = Partner(_id: id, fullName: fullName)
        
        try RealmManager.shared.write {
            self.partner =  newPartner
            RealmManager.shared.add(newPartner)
            debugPrint("partner created successfully \(newPartner)")
        }

    }
    
    @MainActor
    func getPartner() async {
        
        guard let realm = RealmManager.shared.realm else {
            await RealmManager.shared.initialize()
            print("error getPartner ")
            return
        }
        
        guard let id = app.currentUser?.id else {
            print("error getPartner currentUser ")
            
            return
        }
        
        self.partner = realm.object(ofType: Partner.self, forPrimaryKey: id)
        
        debugPrint("partner::found::\(partner.debugDescription)")
        
    }
    
    
    

    
}
