import SwiftUI

@main
struct SDROutdoorApp: App {
    @StateObject private var engine = SDROutdoorEngine()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(engine)
        }
    }
}
