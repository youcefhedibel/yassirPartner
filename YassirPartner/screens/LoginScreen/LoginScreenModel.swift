//
//  LoginScreenModel.swift
//  YassirPartner
//
//  Created by macbook  on 20/5/2024.
//

import Foundation

extension LoginScreen {
    class Model: ObservableObject {

        @Published var isLoading: Bool = false
        
        @MainActor
        func login(email: String, password: String) {
            self.isLoading = true
            Task {
                do {
                    try await LoginRepo.sharedLogin.login(email: email, password: password)
                    await PartnerRepo.sharedPartner.getPartner()
                }  catch {
                    self.isLoading = false
                    print("username or password incorrect")
                }
            }
        }
        
        @MainActor
        func signup(fullname: String, email: String, password: String) {
            self.isLoading = true
            Task {
                do {
                    try await LoginRepo.sharedLogin.signUp(email: email, password: password, fullname: fullname)
                    
                } catch {
                    print("failed to sign up")
                    self.isLoading = false
                }
            }
        }
        
    }
}
