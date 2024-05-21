//
//  OpenRealmView.swift
//  YassirPartner
//
//  Created by macbook  on 19/5/2024.
//
import SwiftUI
import RealmSwift

struct OpenRealmView: View {
    @AutoOpen(appId: app.appId, timeout: 2000) var autoOpen
    
//    @ObservedObject var driver: Driver
    
    let realmManager = RealmManager.shared

    var body: some View {
        Text("BATATA TATA").font(.black, .regular, 30)
        switch autoOpen {
        case .connecting:
            ProgressView().onAppear{ print("connecting") }
        case .waitingForUser:
            LoginScreen()
        case .open(let realm):
            HomeScreen()
        case .progress(let progress):
            ProgressView(progress).onAppear{ print("progress") }
        case .error(let error):
            EmptyView()
        }
    }
}
