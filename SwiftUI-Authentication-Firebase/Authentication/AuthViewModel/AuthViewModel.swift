//
//  AuthViewModel.swift
//  SwiftUI-Authentication-Firebase
//
//  Created by ReetDhillon on 2024-01-26.
//
import Foundation
import Firebase
import FirebaseFirestoreSwift

protocol AuthenticationFormProtocol {
    var formIsValid: Bool { get }
}

@MainActor
class AuthViewModel: ObservableObject {
    @Published var userSession: Firebase.User?
    @Published var currentUser: UserInfo?
    
    init () {
        self.userSession = Auth.auth().currentUser
        
        Task {
            await fetchUser()
        }
    }
    func signIn(withEmail email: String, password: String) async throws{
        print("SIgn In ...")
        do { 
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
            await fetchUser() //it will fetch user from database
        } catch {
            print("DEBUG: Failed to login in user with error \(error.localizedDescription)")
        }
    }
    func createUser(withEmail email: String, password: String, fullName: String)async throws{
        print("Create User ...")
        do{
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            let userObj = UserInfo(id: result.user.uid, fullName: fullName, email: email)
            let encodedUser = try Firestore.Encoder().encode(userObj)
            try await Firestore.firestore().collection("users").document(userObj.id).setData(encodedUser)
            await fetchUser()
            
        } catch {
            print("DEBUG: Failed to create user with error \(error.localizedDescription)")
        }
    }
    func signOut() {
        do {
            try Auth.auth().signOut() //Sign out user from backend
            self.userSession = nil //wipes out user session and go to login screen
            self.currentUser = nil //wipes out current login user from data model
        } catch {
            print("DEBUG: Failed to sign out with error \(error.localizedDescription)")
        }
    }
    func deleteAccount() {
        
    }
    func fetchUser() async {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        guard let snapshot = try? await  Firestore.firestore().collection("users").document(uid).getDocument() else { return }
        
        self.currentUser  = try? snapshot.data(as: UserInfo.self)
        
        print("DEBUG: Current User is : \(String(describing: self.currentUser))")
        
    }
    
}
