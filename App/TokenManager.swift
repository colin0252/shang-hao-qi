import SwiftUI

class TokenManager: ObservableObject {
    @Published var savedToken: String = ""
    @Published var pendingAuth: Bool = false
    @Published var callbackScheme: String = ""
    
    private let tokenKey = "com.delta.login.token"
    
    init() {
        loadToken()
    }
    
    func saveToken(_ token: String) {
        savedToken = token
        UserDefaults.standard.set(token, forKey: tokenKey)
    }
    
    func loadToken() {
        savedToken = UserDefaults.standard.string(forKey: tokenKey) ?? ""
    }
    
    func clearToken() {
        savedToken = ""
        UserDefaults.standard.removeObject(forKey: tokenKey)
    }
}
