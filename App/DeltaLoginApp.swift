import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // 强制窗口铺满屏幕，根治自签黑边
        DispatchQueue.main.async {
            if let window = UIApplication.shared.windows.first {
                window.frame = UIScreen.main.bounds
            }
            if let window = self.window {
                window.frame = UIScreen.main.bounds
            }
        }
        return true
    }

    // 如果支持 SceneDelegate，保留这个方法；没有则删除下面这段
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
}