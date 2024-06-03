//
//  ContentView.swift
//  YassirPartner
//
//  Created by macbook  on 19/5/2024.
//

import SwiftUI
import RealmSwift

struct ContentView: View {
    @StateObject private var realmManager = RealmManager.shared
    @StateObject private var partnerManager = PartnerRepo.sharedPartner
    
    var body: some View {
        if let _ = app.currentUser {
            ZStack{
                if let partner = partnerManager.partner,
                   nil != realmManager.realm {

                    OpenRealmView(partner: partner)
                }
            }
            .task{  await realmManager.initialize() }
        } else {
            LoginScreen()
        }

    }
    
    private func runTasks() async {
        await realmManager.initialize()
    }
}
