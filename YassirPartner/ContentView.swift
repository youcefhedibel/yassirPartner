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
    var body: some View {
        Text("El hadj Hocine").font(.black, .regular, 30)

        if nil != realmManager.realm {
            ZStack{
                if let realm = realmManager.realm {
                    OpenRealmView()
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
