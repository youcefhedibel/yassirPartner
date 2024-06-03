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
    
    @ObservedObject var partner: Partner

    var body: some View {
        switch autoOpen {
        case .connecting:
            ProgressView().onAppear{ print("connecting") }
        case .waitingForUser:
            LoginScreen()
        case .open(let realm):
            HomeScreen(partner: partner)
        case .progress(let progress):
            ProgressView(progress).onAppear{ print("progress") }
        case .error(let error):
            EmptyView().onAppear{ print("error \(error)") }
        }
    }
}
