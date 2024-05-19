//
//  Partner.swift
//  YassirPartner
//
//  Created by macbook  on 19/5/2024.
//

import Foundation
import RealmSwift
import CoreLocation

class Partner: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var _id: String
    
    @Persisted var fullName: String
    
    @Persisted var email: String
    
    @Persisted var phone: String
    
    @Persisted var gender: Gender
    
    @Persisted var currentMission: Mission
    
    @Persisted var lastLocatin: Location
    
    
    
    

}

extension Partner {
    enum Gender: String, PersistableEnum {
        case male
        case female
    }
}
