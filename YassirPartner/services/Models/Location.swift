//
//  Location.swift
//  YassirPartner
//
//  Created by macbook  on 19/5/2024.
//

import Foundation
import RealmSwift
import CoreLocation


class Location: Object {
    @Persisted(primaryKey: true) var _id : ObjectId
   @Persisted var latitude: String
   @Persisted var longitude: String
    
    
    convenience init(latitude: CLLocationDegrees, longitude: CLLocationDegrees) {
        self.init() // Call the designated initializer
        self._id = .generate()
        self.latitude = String(latitude)
        self.longitude = String(longitude)
    }
}
