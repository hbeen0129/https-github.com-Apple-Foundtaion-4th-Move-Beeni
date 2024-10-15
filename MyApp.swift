import SwiftUI

@main
struct MyApp: App {
    var body: some Scene {
        WindowGroup {
            if UserDefaults.standard.bool(forKey: "hasSeenSplashScreen") {
                ContentView()
            } else {
                SplashScreen()
            }
        }
    }
}

