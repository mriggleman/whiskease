import SwiftUI
import Combine

@MainActor
class StoryViewModel: ObservableObject {
    @Published var currentStoryIndex: Int = 0
    @Published var storyPath: [Int] = [0]
    @Published var isAnimating: Bool = false
    
    private let stories: [Story]
    private let haptics = UIImpactFeedbackGenerator(style: .medium)
    
    var currentStory: Story {
        stories[currentStoryIndex]
    }
    
    var progress: Double {
        let maxDepth = 8.0 // Approximate max depth of decision tree
        return min(Double(storyPath.count) / maxDepth, 1.0)
    }
    
    init() {
        self.stories = StoryViewModel.loadStories()
        haptics.prepare()
    }
    
    func makeChoice(_ destinationIndex: Int) {
        haptics.impactOccurred()
        
        withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
            isAnimating = true
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            withAnimation(.easeInOut(duration: 0.3)) {
                self.currentStoryIndex = destinationIndex
                self.storyPath.append(destinationIndex)
                self.isAnimating = false
            }
        }
    }
    
    func goBack() {
        guard storyPath.count > 1 else { return }
        haptics.impactOccurred()
        
        withAnimation(.easeInOut(duration: 0.3)) {
            storyPath.removeLast()
            currentStoryIndex = storyPath.last ?? 0
        }
    }
    
    func restart() {
        haptics.impactOccurred()
        
        withAnimation(.easeInOut(duration: 0.4)) {
            currentStoryIndex = 0
            storyPath = [0]
        }
    }
    
    static func loadStories() -> [Story] {
        // Convert your existing stories array to the new model
        return [
            Story(id: 0, text: "Let's find the perfect whiskey for you! Are you looking for a specific style of whiskey?", 
                  choices: [
                      Story.Choice(id: 0, text: "Yes", destination: 1),
                      Story.Choice(id: 1, text: "No", destination: 2)
                  ], imageName: nil, isEndpoint: false, category: nil),
            
            Story(id: 1, text: "Which style of whiskey are you looking for?",
                  choices: [
                      Story.Choice(id: 0, text: "Bourbon or Rye", destination: 3),
                      Story.Choice(id: 1, text: "Irish", destination: 12),
                      Story.Choice(id: 2, text: "Scotch", destination: 2)
                  ], imageName: nil, isEndpoint: false, category: nil),
            
            Story(id: 2, text: "Do you like smoky flavors such as BBQ and bacon?",
                  choices: [
                      Story.Choice(id: 0, text: "Yes", destination: 4),
                      Story.Choice(id: 1, text: "No", destination: 3)
                  ], imageName: nil, isEndpoint: false, category: nil),
            
            Story(id: 3, text: "Great choice! Now, do you prefer bold flavors or smooth finishes?",
                  choices: [
                      Story.Choice(id: 0, text: "Bold flavor", destination: 7),
                      Story.Choice(id: 1, text: "Smooth finish", destination: 6)
                  ], imageName: nil, isEndpoint: false, category: nil),
            
            Story(id: 4, text: "Perfect! So you like smoky flavors. In whiskey circles this is referred to as peat or peatiness. How much do you like these bold, smoky flavors?",
                  choices: [
                      Story.Choice(id: 0, text: "I like a hint of smoke", destination: 5),
                      Story.Choice(id: 1, text: "I want a campfire in a glass", destination: 10)
                  ], imageName: nil, isEndpoint: false, category: nil),
            
            Story(id: 5, text: "Do you like sweet flavors like honey?",
                  choices: [
                      Story.Choice(id: 0, text: "Yes", destination: 8),
                      Story.Choice(id: 1, text: "No", destination: 9)
                  ], imageName: nil, isEndpoint: false, category: nil),
            
            Story(id: 6, text: "Do you have a preference between American and European whiskeys?",
                  choices: [
                      Story.Choice(id: 0, text: "American", destination: 11),
                      Story.Choice(id: 1, text: "European", destination: 12),
                      Story.Choice(id: 2, text: "No preference", destination: 13)
                  ], imageName: nil, isEndpoint: false, category: nil),
            
            Story(id: 7, text: "Based on your answers, we believe you'll love rye whiskeys and bourbons with high rye content. These whiskeys have bolder flavors than many bourbons but are smoother than a scotch.",
                  choices: [
                      Story.Choice(id: 0, text: "Big Brands", destination: 20),
                      Story.Choice(id: 1, text: "Hidden Gems", destination: 21)
                  ], imageName: nil, isEndpoint: false, category: .rye),
            
            Story(id: 8, text: "We think you'd really enjoy Speysides. These are scotches from a specific region known for their sweet, elegant character.",
                  choices: [
                      Story.Choice(id: 0, text: "Big Brands", destination: 22),
                      Story.Choice(id: 1, text: "Hidden Gems", destination: 23)
                  ], imageName: nil, isEndpoint: false, category: .speyside),
            
            Story(id: 9, text: "We think you would love a Highland malt. Highland malts have a delightful balance of smoke, salt, and fruit flavors.",
                  choices: [
                      Story.Choice(id: 0, text: "Big Brands", destination: 24),
                      Story.Choice(id: 1, text: "Hidden Gems", destination: 25)
                  ], imageName: nil, isEndpoint: false, category: .highland),
            
            Story(id: 10, text: "We think you would love an Islay: boldly peaty whiskeys from an island off the West coast of Scotland.",
                  choices: [
                      Story.Choice(id: 0, text: "Big Brands", destination: 26),
                      Story.Choice(id: 1, text: "Hidden Gems", destination: 27)
                  ], imageName: nil, isEndpoint: false, category: .islay),
            
            Story(id: 11, text: "We think you would love a nice, smooth bourbon. Bourbons are known for their sweet, caramel notes.",
                  choices: [
                      Story.Choice(id: 0, text: "Big Brands", destination: 14),
                      Story.Choice(id: 1, text: "Hidden Gems", destination: 15)
                  ], imageName: nil, isEndpoint: false, category: .bourbon),
            
            Story(id: 12, text: "We think you'll love a nice Irish whiskey. Ireland is the homeland of whiskey—the word comes from 'uisce beatha' (water of life).",
                  choices: [
                      Story.Choice(id: 0, text: "Big Brands", destination: 16),
                      Story.Choice(id: 1, text: "Hidden Gems", destination: 17)
                  ], imageName: nil, isEndpoint: false, category: .irish),
            
            Story(id: 13, text: "It sounds like you're looking for a smooth sipping whiskey. Both bourbons and Irish whiskeys are triple-distilled for extra smoothness.",
                  choices: [
                      Story.Choice(id: 0, text: "Big Brands", destination: 18),
                      Story.Choice(id: 1, text: "Hidden Gems", destination: 19)
                  ], imageName: nil, isEndpoint: false, category: .smooth),
            
            // Price selection stories (14-27)
            Story(id: 14, text: "One last question—how much are you looking to spend?",
                  choices: [
                      Story.Choice(id: 0, text: "Under $35", destination: 46),
                      Story.Choice(id: 1, text: "$35 - $75", destination: 47),
                      Story.Choice(id: 2, text: "Over $75", destination: 48)
                  ], imageName: nil, isEndpoint: false, category: .bourbon),
            
            Story(id: 15, text: "One last question—how much are you looking to spend?",
                  choices: [
                      Story.Choice(id: 0, text: "Under $35", destination: 49),
                      Story.Choice(id: 1, text: "$35 - $75", destination: 50),
                      Story.Choice(id: 2, text: "Over $75", destination: 51)
                  ], imageName: nil, isEndpoint: false, category: .bourbon),
            
            Story(id: 16, text: "One last question—how much are you looking to spend?",
                  choices: [
                      Story.Choice(id: 0, text: "Under $35", destination: 52),
                      Story.Choice(id: 1, text: "$35 - $75", destination: 53),
                      Story.Choice(id: 2, text: "Over $75", destination: 54)
                  ], imageName: nil, isEndpoint: false, category: .irish),
            
            Story(id: 17, text: "One last question—how much are you looking to spend?",
                  choices: [
                      Story.Choice(id: 0, text: "Under $35", destination: 55),
                      Story.Choice(id: 1, text: "$35 - $75", destination: 56),
                      Story.Choice(id: 2, text: "Over $75", destination: 57)
                  ], imageName: nil, isEndpoint: false, category: .irish),
            
            Story(id: 18, text: "One last question—how much are you looking to spend?",
                  choices: [
                      Story.Choice(id: 0, text: "Under $35", destination: 58),
                      Story.Choice(id: 1, text: "$35 - $75", destination: 59),
                      Story.Choice(id: 2, text: "Over $75", destination: 60)
                  ], imageName: nil, isEndpoint: false, category: .smooth),
            
            Story(id: 19, text: "One last question—how much are you looking to spend?",
                  choices: [
                      Story.Choice(id: 0, text: "Under $35", destination: 61),
                      Story.Choice(id: 1, text: "$35 - $75", destination: 62),
                      Story.Choice(id: 2, text: "Over $75", destination: 63)
                  ], imageName: nil, isEndpoint: false, category: .smooth),
            
            Story(id: 20, text: "One last question—how much are you looking to spend?",
                  choices: [
                      Story.Choice(id: 0, text: "Under $35", destination: 28),
                      Story.Choice(id: 1, text: "$35 - $75", destination: 29),
                      Story.Choice(id: 2, text: "Over $75", destination: 30)
                  ], imageName: nil, isEndpoint: false, category: .rye),
            
            Story(id: 21, text: "One last question—how much are you looking to spend?",
                  choices: [
                      Story.Choice(id: 0, text: "Under $35", destination: 31),
                      Story.Choice(id: 1, text: "$35 - $75", destination: 32),
                      Story.Choice(id: 2, text: "Over $75", destination: 33)
                  ], imageName: nil, isEndpoint: false, category: .rye),
            
            Story(id: 22, text: "One last question—how much are you looking to spend?",
                  choices: [
                      Story.Choice(id: 0, text: "Under $75", destination: 34),
                      Story.Choice(id: 1, text: "Over $75", destination: 35)
                  ], imageName: nil, isEndpoint: false, category: .speyside),
            
            Story(id: 23, text: "One last question—how much are you looking to spend?",
                  choices: [
                      Story.Choice(id: 0, text: "Under $75", destination: 36),
                      Story.Choice(id: 1, text: "Over $75", destination: 37)
                  ], imageName: nil, isEndpoint: false, category: .speyside),
            
            Story(id: 24, text: "One last question—how much are you looking to spend?",
                  choices: [
                      Story.Choice(id: 0, text: "Under $75", destination: 38),
                      Story.Choice(id: 1, text: "Over $75", destination: 39)
                  ], imageName: nil, isEndpoint: false, category: .highland),
            
            Story(id: 25, text: "One last question—how much are you looking to spend?",
                  choices: [
                      Story.Choice(id: 0, text: "Under $75", destination: 40),
                      Story.Choice(id: 1, text: "Over $75", destination: 41)
                  ], imageName: nil, isEndpoint: false, category: .highland),
            
            Story(id: 26, text: "One last question—how much are you looking to spend?",
                  choices: [
                      Story.Choice(id: 0, text: "Under $75", destination: 42),
                      Story.Choice(id: 1, text: "Over $75", destination: 43)
                  ], imageName: nil, isEndpoint: false, category: .islay),
            
            Story(id: 27, text: "One last question—how much are you looking to spend?",
                  choices: [
                      Story.Choice(id: 0, text: "Under $75", destination: 44),
                      Story.Choice(id: 1, text: "Over $75", destination: 45)
                  ], imageName: nil, isEndpoint: false, category: .islay),
            
            // Endpoint recommendations (28-63)
            Story(id: 28, text: "Here are some well-known ryes and bourbons that we love under $35",
                  choices: [], imageName: "rye", isEndpoint: true, category: .rye),
            
            Story(id: 29, text: "Here are some well-known ryes and bourbons between $35 and $75",
                  choices: [], imageName: "rye2", isEndpoint: true, category: .rye),
            
            Story(id: 30, text: "Here are some well-known ryes and bourbons over $75",
                  choices: [], imageName: "rye3", isEndpoint: true, category: .rye),
            
            Story(id: 31, text: "Here are some cool ryes and bourbons under $35",
                  choices: [], imageName: "rye4", isEndpoint: true, category: .rye),
            
            Story(id: 32, text: "Here are some cool ryes and bourbons between $35 and $75",
                  choices: [], imageName: "rye5", isEndpoint: true, category: .rye),
            
            Story(id: 33, text: "Our favorite ryes and bourbons over $75",
                  choices: [], imageName: "rye6", isEndpoint: true, category: .rye),
            
            Story(id: 34, text: "Our favorite well-known Speyside single malts under $75",
                  choices: [], imageName: "speyside1", isEndpoint: true, category: .speyside),
            
            Story(id: 35, text: "Our favorite well-known Speyside single malts over $75",
                  choices: [], imageName: "speyside2", isEndpoint: true, category: .speyside),
            
            Story(id: 36, text: "Some cool Speyside single malts under $75",
                  choices: [], imageName: "speyside3", isEndpoint: true, category: .speyside),
            
            Story(id: 37, text: "Some cool Speyside single malts over $75",
                  choices: [], imageName: "speyside4", isEndpoint: true, category: .speyside),
            
            Story(id: 38, text: "Our favorite popular Highland single malts under $75",
                  choices: [], imageName: "highland", isEndpoint: true, category: .highland),
            
            Story(id: 39, text: "Our favorite popular Highland single malts over $75",
                  choices: [], imageName: "highland2", isEndpoint: true, category: .highland),
            
            Story(id: 40, text: "Some Highland single malts under $75",
                  choices: [], imageName: "highland3", isEndpoint: true, category: .highland),
            
            Story(id: 41, text: "Some Highland single malts over $75",
                  choices: [], imageName: "highland4", isEndpoint: true, category: .highland),
            
            Story(id: 42, text: "Top picks for popular Islay single malts under $75",
                  choices: [], imageName: "islay", isEndpoint: true, category: .islay),
            
            Story(id: 43, text: "Top picks for popular Islay single malts over $75",
                  choices: [], imageName: "islay2", isEndpoint: true, category: .islay),
            
            Story(id: 44, text: "Some cool Islay single malts under $75",
                  choices: [], imageName: "islay3", isEndpoint: true, category: .islay),
            
            Story(id: 45, text: "Some cool Islay single malts over $75",
                  choices: [], imageName: "islay4", isEndpoint: true, category: .islay),
            
            Story(id: 46, text: "Our favorite popular bourbons under $35",
                  choices: [], imageName: "bourbon1", isEndpoint: true, category: .bourbon),
            
            Story(id: 47, text: "Our favorite popular bourbons between $35 and $75",
                  choices: [], imageName: "bourbon2", isEndpoint: true, category: .bourbon),
            
            Story(id: 48, text: "Our favorite popular bourbons over $75",
                  choices: [], imageName: "bourbon3", isEndpoint: true, category: .bourbon),
            
            Story(id: 49, text: "Some cool bourbons under $35",
                  choices: [], imageName: "bourbon4", isEndpoint: true, category: .bourbon),
            
            Story(id: 50, text: "Our favorite bourbons between $35 and $75",
                  choices: [], imageName: "bourbon5", isEndpoint: true, category: .bourbon),
            
            Story(id: 51, text: "Our favorite bourbons over $75",
                  choices: [], imageName: "bourbon6", isEndpoint: true, category: .bourbon),
            
            Story(id: 52, text: "Our favorite Irish whiskeys under $35",
                  choices: [], imageName: "irish1", isEndpoint: true, category: .irish),
            
            Story(id: 53, text: "Our favorite Irish whiskeys between $35 and $75",
                  choices: [], imageName: "irish2", isEndpoint: true, category: .irish),
            
            Story(id: 54, text: "Our favorite Irish whiskeys over $75",
                  choices: [], imageName: "irish3", isEndpoint: true, category: .irish),
            
            Story(id: 55, text: "Some cool Irish whiskeys under $35",
                  choices: [], imageName: "irish4", isEndpoint: true, category: .irish),
            
            Story(id: 56, text: "Some cool Irish whiskeys between $35 and $75",
                  choices: [], imageName: "irish5", isEndpoint: true, category: .irish),
            
            Story(id: 57, text: "Some cool Irish whiskeys over $75",
                  choices: [], imageName: "irish6", isEndpoint: true, category: .irish),
            
            Story(id: 58, text: "Popular lighter-bodied whiskeys under $35",
                  choices: [], imageName: "smooth1", isEndpoint: true, category: .smooth),
            
            Story(id: 59, text: "Popular lighter-bodied whiskeys between $35 and $75",
                  choices: [], imageName: "smooth2", isEndpoint: true, category: .smooth),
            
            Story(id: 60, text: "Popular lighter-bodied whiskeys over $75",
                  choices: [], imageName: "smooth3", isEndpoint: true, category: .smooth),
            
            Story(id: 61, text: "Lighter-bodied whiskeys under $35",
                  choices: [], imageName: "smooth4", isEndpoint: true, category: .smooth),
            
            Story(id: 62, text: "Lighter-bodied whiskeys between $35 and $75",
                  choices: [], imageName: "smooth5", isEndpoint: true, category: .smooth),
            
            Story(id: 63, text: "Lighter-bodied whiskeys over $75",
                  choices: [], imageName: "smooth6", isEndpoint: true, category: .smooth)
        ]
    }
}
