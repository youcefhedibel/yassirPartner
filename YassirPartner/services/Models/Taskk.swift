//
//  Task.swift
//  YassirPartner
//
//  Created by macbook  on 19/5/2024.
//

import Foundation
import RealmSwift

class Taskk: Object {
    
    @Persisted(primaryKey: true) var _id: ObjectId
    
    @Persisted var t_name: String
    
    @Persisted var t_description: String
    
    @Persisted var t_income: Double
    
    @Persisted var t_service: String
    
    @Persisted var t_icon: String
    
    @Persisted var customerPhone: String
    
    @Persisted var t_location: String
    
    @Persisted var payment_methods: String
    
    convenience init(t_name: String, t_description: String, t_income: Double, t_service: String, t_icon: String, customerPhone: String, t_location: String, payment_methods: String) {
        self.init()
        self._id = .generate()
        self.t_name = t_name
        self.t_description = t_description
        self.t_income = t_income
        self.t_service = t_service
        self.t_icon = t_icon
        self.customerPhone = customerPhone
        self.t_location = t_location
        self.payment_methods = payment_methods
    }
}
