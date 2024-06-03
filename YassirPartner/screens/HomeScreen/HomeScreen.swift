//
//  HomeScreen.swift
//  YassirPartner
//
//  Created by macbook  on 20/5/2024.
//

import SwiftUI

struct HomeScreen: View {
    @ObservedObject var partner: Partner

    
    var body: some View {
        VStack{
            Text("Home screen")
            Text("\(partner.fullName)")
        }
    }
}

#Preview {
    HomeScreen(partner: Partner(_id: "RTYUJ", fullName: "Youcef Hedibel"))
}
