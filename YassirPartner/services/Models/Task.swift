//
//  Task.swift
//  YassirPartner
//
//  Created by macbook  on 19/5/2024.
//

import Foundation
import RealmSwift

//class Task: EmbeddedObject {
//    
//        @Persisted var t_name: String = ""
//    
//        @Persisted var t_description: String = ""
//    
//        @Persisted var t_location: Location? 
//    
//        @Persisted var t_status: TaskStatus
//}

class Taskk: Object, ObjectKeyIdentifiable {
    
    @Persisted(primaryKey: true) var _id: ObjectId

    @Persisted var t_name: String
    
    @Persisted var t_description: String
    
    @Persisted var t_location: Location?
    
    @Persisted var t_status: TaskStatus
    
    @Persisted(originProperty: "tasks") var mission: LinkingObjects<Mission>

    convenience init (t_name: String, t_description: String, status: TaskStatus) {
        self.init()
        self._id = .generate()
        self.t_name = t_name
        self.t_description = t_description
        self.t_status = status
    }
}

enum TaskStatus: String, PersistableEnum {
    case pending
    case start
    case finished
}
