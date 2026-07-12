import SwiftUI

@main
struct DeltaLoginApp: App {
    @StateObject private var tokenManager = TokenManager()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
                    .environmentObject(tokenManager)
            }
            .navigationViewStyle(.stack)
            .ignoresSafeArea(.all)          // 关键：全面屏铺满
            .onOpenURL { url in
                handleIncomingURL(url, tokenManager: tokenManager)
            }
        }
    }
    
    private func handleIncomingURL(_ url: URL, tokenManager: TokenManager) {
        guard let components = URLComponents(url: url, resolvingAgainstBaseURL: false),
              components.scheme == "mqq" else { return }
        
        if let callback = components.queryItems?.first(where: { $0.name == "callback" })?.value {
            tokenManager.callbackScheme = callback
        }
        tokenManager.pendingAuth = true
    }
}