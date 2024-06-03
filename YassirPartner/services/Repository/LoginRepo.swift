//
//  LoginRepo.swift
//  YassirPartner
//
//  Created by macbook  on 21/5/2024.
//

import Foundation

class LoginRepo: RealmManager {
    
    static let sharedLogin = LoginRepo()
    

    
    @MainActor
    func login(email: String, password: String) async throws {
        let _ = try await app.login(credentials: .emailPassword(email: email, password: password))
    }
    
    @MainActor
    func signUp(email: String, password: String, fullname: String) async throws {
        
        try await app.emailPasswordAuth.registerUser(email: email, password: password)
        try await self.login(email: email, password: password)
        try await PartnerRepo.sharedPartner.createPartner(fullName: fullname)
    }
    
    @MainActor
    func loggout() {
        app.currentUser?.logOut { (error) in
            if let error = error {
                print("Error logging out: \(error.localizedDescription)")
            } else {
                print("User logged out successfully")
            }
        }
    }
    

}
