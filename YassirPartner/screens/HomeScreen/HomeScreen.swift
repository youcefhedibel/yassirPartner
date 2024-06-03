//
//  HomeScreen.swift
//  YassirPartner
//
//  Created by macbook  on 20/5/2024.
//

import SwiftUI
import RealmSwift

struct HomeScreen: View {
    @ObservedRealmObject var partner: Partner
    @StateObject private var model = Model()
    @State var isOnline: Bool
    
    var statusTitle: String {
        if partner.missions_id != nil {
            return "New request recieved"
        } else {
            if isOnline {
                return "You are in service"
            } else {
                return "You are out of service"
            }
        }
    }
    
    init(partner: Partner) {
        self._partner = ObservedRealmObject(wrappedValue: partner)
        self._isOnline = State(initialValue: partner.isOnline)
    }
    
    var body: some View {
        NavigationStack{
            ZStack(alignment: .bottom) {
                Mapview(currentMarker: model.currentMarker, markers: model.markersList)
                ZStack{
                    VStack{
                        HStack {
                            Spacer()
                            CircleButton(image: Image(systemName: "dot.scope"), tint: Color.black) {
                                model.updateCurrentPosition()
                            }.padding(16)
                        }
                        VStack(alignment: .leading, spacing: 16) {
                            Text("Welcome back \(partner.fullName)")
                                .font(.primaryText, .extraBold, 20)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            Toggle(statusTitle, isOn: $isOnline)
                                .font(.system(size: 20, weight: .bold))
                                .padding()
                                .onChange(of: isOnline) { _, newValue in
                                    model.updateDriverOnline(isOnline: newValue)
                                }
                                .onChange(of: partner.isOnline) { _, newValue in
                                    isOnline = newValue
                                }
                            
                        }.padding(.horizontal, 14)
                            .padding(.vertical, 20)
                            .padding(.bottom,30)
                            .background(Color.white)
                    }.padding(.top, CGFloat.heightPer(per: 0.06))
                   
                    
                
                }
                
            }.ignoresSafeArea()
             .navigationBarBackButtonHidden(true)
        }
    }
}

#Preview {
    HomeScreen(partner: Partner(_id: "RTYUJ", fullName: "Youcef Hedibel"))
}
