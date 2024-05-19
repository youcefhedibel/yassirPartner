//
//  RealmConfig.swift
//  YassirPartner
//
//  Created by macbook  on 19/5/2024.
//

import Foundation
import RealmSwift

var app: App {
    return App(id: RealmConfig.shared.appConfig.appId,
               configuration: AppConfiguration(
                baseURL: RealmConfig.shared.appConfig.baseUrl,
                transport: nil)
    )
}

fileprivate class RealmConfig {
    
    static let shared = RealmConfig()

    struct AppConfig {
        var appId: String
        var baseUrl: String
    }
    
    var appConfig: AppConfig {
        return loadAppConfig()
    }
    
    private func loadAppConfig() -> AppConfig {
        
        guard let path = Bundle.main.path(forResource: "atlasConfig", ofType: "plist") else {
            fatalError("Could not load atlasConfig.plist file!")
        }
        
        let data = NSData(contentsOfFile: path)! as Data
        let atlasConfigPropertyList = try! PropertyListSerialization.propertyList(from: data, format: nil) as! [String: Any]
        let appId = atlasConfigPropertyList["appId"]! as! String
        let baseUrl = atlasConfigPropertyList["baseUrl"]! as! String
        
        return AppConfig(appId: appId, baseUrl: baseUrl)

    }
}
