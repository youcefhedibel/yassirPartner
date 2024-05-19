//
//  Location.swift
//  YassirPartner
//
//  Created by macbook  on 19/5/2024.
//

import Foundation
import RealmSwift


class Location: Object {
   @Persisted var latitude: String
   @Persisted var longuitude: String
}
