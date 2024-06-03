//
//  YassirPartnerApp.swift
//  YassirPartner
//
//  Created by macbook  on 19/5/2024.
//

import SwiftUI
import RealmSwift

@main
struct YassirPartnerApp: SwiftUI.App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onAppear{
                    LocationManager.shared.requestLocation()
//                    Logger.shared.level = .trace
                }
        }
    }
}

