//
//  Mission.swift
//  YassirPartner
//
//  Created by macbook  on 19/5/2024.
//

import Foundation
import RealmSwift
import Realm

class Mission: Object {
    @Persisted(primaryKey: true) var _id: ObjectId
    
    @Persisted var m_title: String
    
    @Persisted var m_description: String
    
    @Persisted var tasks: List<Taskk>
    
    @Persisted var mission_state: MissionStatus
  
    convenience init(m_title: String, m_description: String) {
        self.init()
        self._id = .generate()
        self.m_title = m_title
        self.m_description = m_description
    }
}

enum MissionStatus: String, PersistableEnum {
    case pending
    case start
    case finished
}
