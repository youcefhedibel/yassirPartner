//
//  Mission.swift
//  YassirPartner
//
//  Created by macbook  on 19/5/2024.
//

import Foundation
import RealmSwift

class Mission: Object {
    @Persisted(primaryKey: true) var id: ObjectId
    
    @Persisted var m_title: String
    
    @Persisted var m_description: String
    
    @Persisted var tasks: List<Task>
    
    @Persisted var mission_income: Double
    
    @Persisted var current_income: Double
    
    @Persisted var created_at: Date

}
