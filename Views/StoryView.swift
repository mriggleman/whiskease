import SwiftUI

struct StoryView: View {
    @StateObject private var viewModel = StoryViewModel()
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ZStack {
            // Background
            LinearGradient(
                colors: [
                    Color(hex: "1A1A2E"),
                    Color(hex: "16213E"),
                    Color(hex: "0F3460")
                ],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
            
            VStack(spacing: 0) {
                // Header with progress
                VStack(spacing: 12) {
                    HStack {
                        if viewModel.storyPath.count > 1 {
                            Button(action: { viewModel.goBack() }) {
                                HStack(spacing: 6) {
                                    Image(systemName: "chevron.left")
                                    Text("Back")
                                }
                                .font(.system(.body, design: .rounded))
                                .foregroundColor(Color(hex: "D4A574"))
                            }
                            .transition(.move(edge: .leading).combined(with: .opacity))
                        }
                        
                        Spacer()
                        
                        Button(action: { viewModel.restart() }) {
                            Image(systemName: "arrow.counterclockwise")
                                .font(.system(.body, design: .rounded))
                                .foregroundColor(Color(hex: "D4A574"))
                        }
                    }
                    .padding(.horizontal)
                    
                    ProgressBar(progress: viewModel.progress)
                        .padding(.horizontal)
                }
                .padding(.top, 8)
                .padding(.bottom, 16)
                
                // Main content
                ScrollView {
                    VStack(spacing: 30) {
                        // Question card
                        VStack(spacing: 20) {
                            if let category = viewModel.currentStory.category {
                                HStack {
                                    Image(systemName: categoryIcon(for: category))
                                        .font(.title2)
                                    Text(category.rawValue)
                                        .font(.system(.subheadline, design: .rounded))
                                        .fontWeight(.semibold)
                                }
                                .foregroundColor(Color(hex: "D4A574"))
                                .padding(.horizontal, 16)
                                .padding(.vertical, 8)
                                .background(Color(hex: "D4A574").opacity(0.15))
                                .cornerRadius(12)
                            }
                            
                            Text(viewModel.currentStory.text)
                                .font(.system(.title2, design: .rounded))
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                                .multilineTextAlignment(.center)
                                .lineSpacing(4)
                                .padding(.horizontal)
                        }
                        .padding(.vertical, 30)
                        .frame(maxWidth: .infinity)
                        .background(
                            RoundedRectangle(cornerRadius: 24)
                                .fill(Color.white.opacity(0.05))
                                .overlay(
                                    RoundedRectangle(cornerRadius: 24)
                                        .strokeBorder(
                                            LinearGradient(
                                                colors: [Color(hex: "D4A574").opacity(0.3), Color.clear],
                                                startPoint: .topLeading,
                                                endPoint: .bottomTrailing
                                            ),
                                            lineWidth: 1
                                        )
                                )
                        )
                        .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 10)
                        .opacity(viewModel.isAnimating ? 0 : 1)
                        .scaleEffect(viewModel.isAnimating ? 0.95 : 1.0)
                        
                        // Image if available
                        if let imageName = viewModel.currentStory.imageName, !imageName.isEmpty {
                            Image(imageName)
                                .resizable()
                                .scaledToFit()
                                .frame(maxWidth: 340, maxHeight: 300)
                                .cornerRadius(20)
                                .shadow(color: Color.black.opacity(0.3), radius: 15, x: 0, y: 8)
                                .opacity(viewModel.isAnimating ? 0 : 1)
                        }
                        
                        // Choices or restart
                        if viewModel.currentStory.isEndpoint {
                            VStack(spacing: 16) {
                                Image(systemName: "checkmark.circle.fill")
                                    .font(.system(size: 60))
                                    .foregroundColor(Color(hex: "D4A574"))
                                
                                Text("Perfect Match!")
                                    .font(.system(.title, design: .rounded))
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                
                                Button(action: { viewModel.restart() }) {
                                    HStack {
                                        Image(systemName: "arrow.counterclockwise")
                                        Text("Start Over")
                                            .fontWeight(.semibold)
                                    }
                                    .font(.system(.body, design: .rounded))
                                    .foregroundColor(.white)
                                    .frame(maxWidth: .infinity)
                                    .padding(.vertical, 16)
                                    .background(
                                        LinearGradient(
                                            colors: [Color(hex: "D4A574"), Color(hex: "B8860B")],
                                            startPoint: .leading,
                                            endPoint: .trailing
                                        )
                                    )
                                    .cornerRadius(16)
                                }
                                .buttonStyle(ScaleButtonStyle())
                            }
                            .padding(.top, 20)
                            .opacity(viewModel.isAnimating ? 0 : 1)
                        } else {
                            VStack(spacing: 12) {
                                ForEach(viewModel.currentStory.choices.filter(\.isValid)) { choice in
                                    ChoiceButton(choice: choice) {
                                        viewModel.makeChoice(choice.destination)
                                    }
                                }
                            }
                            .opacity(viewModel.isAnimating ? 0 : 1)
                        }
                    }
                    .padding(.horizontal, 20)
                    .padding(.bottom, 40)
                }
            }
        }
        .animation(.easeInOut(duration: 0.3), value: viewModel.isAnimating)
    }
    
    private func categoryIcon(for category: WhiskeyCategory) -> String {
        switch category {
        case .bourbon, .rye: return "flame.fill"
        case .scotch, .speyside, .highland, .islay: return "leaf.fill"
        case .irish: return "sparkles"
        case .smooth: return "drop.fill"
        }
    }
}
