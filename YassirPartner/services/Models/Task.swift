//
//  Task.swift
//  YassirPartner
//
//  Created by macbook  on 19/5/2024.
//

import Foundation
import RealmSwift

class Task: Object {
    @Persisted(primaryKey: true) var id: ObjectId
    
    @Persisted var t_name: String
    
    @Persisted var t_description: String
    
    @Persisted var t_income: Double
    
    @Persisted var t_service: String
    
    @Persisted var t_icon: String
    
    @Persisted var customerPhone: String
    
    
    @Persisted var t_location: String
    
    @Persisted var payment_methods: String


    
}
