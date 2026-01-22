import SwiftUI

@main
struct WhiskeaseApp: App {
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}

struct MainView: View {
    @State private var showStory = false
    
    var body: some View {
        Group {
            if showStory {
                StoryView()
            } else {
                WelcomeView(showStory: $showStory)
            }
        }
        .preferredColorScheme(.dark)
    }
}
