//
//  Mission.swift
//  YassirPartner
//
//  Created by macbook  on 19/5/2024.
//

import Foundation
import RealmSwift

class Mission: Object {
    @Persisted(primaryKey: true) var _id: ObjectId
    
    @Persisted var m_title: String
    
    @Persisted var m_description: String
    
    @Persisted var tasks: List<Taskk>
    
    @Persisted var mission_income: Double
    
    @Persisted var current_income: Double
    
    @Persisted var created_at: Date
    convenience init(m_title: String, m_description: String, tasks: List<Taskk>, mission_income: Double, current_income: Double, created_at: Date) {
        self.init()
        self._id = .generate()
        self.m_title = m_title
        self.m_description = m_description
        self.tasks = tasks
        self.mission_income = mission_income
        self.current_income = current_income
        self.created_at = created_at
    }

}
