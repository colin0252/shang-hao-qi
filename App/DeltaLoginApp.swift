import SwiftUI

@main
struct DeltaLoginApp: App {
    @StateObject private var tokenManager = TokenManager()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(tokenManager)
                .onOpenURL { url in
                    handleIncomingURL(url, tokenManager: tokenManager)
                }
        }
        .ignoresSafeArea(.all)   // 关键：让窗口忽略所有安全区，强制全屏
    }
    
    private func handleIncomingURL(_ url: URL, tokenManager: TokenManager) {
        guard let components = URLComponents(url: url, resolvingAgainstBaseURL: false),
              components.scheme == "mqq" else { return }
        
        if let callbackScheme = components.queryItems?.first(where: { $0.name == "callback" })?.value {
            tokenManager.callbackScheme = callbackScheme
        }
        tokenManager.pendingAuth = true
    }
}