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
    
    @Persisted var phone: String
    
    @Persisted var gender: Gender
    
    @Persisted var missions_id: String?

    @Persisted var lastLocatin: Location?
    
    convenience init(_id: String, fullName: String) {
        self.init()
        self._id = _id
        self.fullName = fullName
        self.phone = "+213 791892621"
        self.gender = Gender.male
        self.lastLocatin = Location(latitude: LocationManager.shared.userLocation?.coordinate.latitude ?? 36.75198048828322, longitude: LocationManager.shared.userLocation?.coordinate.longitude ?? 2.951066940403462)
    }
    
}

extension Partner {
    enum Gender: String, PersistableEnum {
        case male
        case female
    }
}
