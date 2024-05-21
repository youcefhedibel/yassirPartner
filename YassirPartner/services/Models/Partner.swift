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
    @Persisted(primaryKey: true) var _id: ObjectId
    
    @Persisted var fullName: String
    
    @Persisted var email: String
    
    @Persisted var phone: String
    
    @Persisted var gender: Gender
    
    @Persisted var currentMission: Mission?
    
    @Persisted var lastLocatin: Location?
    
    convenience init(_id: ObjectId, fullName: String, email: String, phone: String, gender: Gender, currentMission: Mission, lastLocatin: Location) {
        self.init()
        self._id = .generate()
        self.fullName = fullName
        self.email = email
        self.phone = phone
        self.gender = Gender.male
        self.currentMission = currentMission
        self.lastLocatin = lastLocatin
    }
    
    
    
    

}

extension Partner {
    enum Gender: String, PersistableEnum {
        case male
        case female
    }
}
