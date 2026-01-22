import SwiftUI

struct WelcomeView: View {
    @Binding var showStory: Bool
    @State private var animateTitle = false
    @State private var animateButton = false
    
    var body: some View {
        ZStack {
            // Background gradient
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
            
            VStack(spacing: 40) {
                Spacer()
                
                // Logo area
                VStack(spacing: 20) {
                    Image(systemName: "wineglass")
                        .font(.system(size: 80))
                        .foregroundStyle(
                            LinearGradient(
                                colors: [Color(hex: "D4A574"), Color(hex: "FFD700")],
                                startPoint: .top,
                                endPoint: .bottom
                            )
                        )
                        .scaleEffect(animateTitle ? 1.0 : 0.5)
                        .opacity(animateTitle ? 1.0 : 0.0)
                    
                    Text("Whiskease")
                        .font(.system(size: 48, weight: .bold, design: .serif))
                        .foregroundStyle(
                            LinearGradient(
                                colors: [Color(hex: "D4A574"), Color(hex: "FFD700")],
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )
                        .scaleEffect(animateTitle ? 1.0 : 0.8)
                        .opacity(animateTitle ? 1.0 : 0.0)
                    
                    Text("Your Personal Whiskey Sommelier")
                        .font(.system(.title3, design: .rounded))
                        .foregroundColor(.white.opacity(0.8))
                        .multilineTextAlignment(.center)
                        .opacity(animateTitle ? 1.0 : 0.0)
                }
                .padding(.horizontal)
                
                Spacer()
                
                // Age verification button
                VStack(spacing: 16) {
                    Button(action: {
                        withAnimation(.spring(response: 0.6, dampingFraction: 0.7)) {
                            showStory = true
                        }
                    }) {
                        HStack {
                            Image(systemName: "checkmark.shield.fill")
                                .font(.title3)
                            
                            Text("I'm 21 or Over")
                                .font(.system(.title3, design: .rounded))
                                .fontWeight(.bold)
                        }
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 18)
                        .background(
                            LinearGradient(
                                colors: [Color(hex: "D4A574"), Color(hex: "B8860B")],
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )
                        .cornerRadius(16)
                        .shadow(color: Color(hex: "D4A574").opacity(0.5), radius: 20, x: 0, y: 10)
                    }
                    .scaleEffect(animateButton ? 1.0 : 0.9)
                    .opacity(animateButton ? 1.0 : 0.0)
                    
                    Text("Please drink responsibly")
                        .font(.caption)
                        .foregroundColor(.white.opacity(0.5))
                        .opacity(animateButton ? 1.0 : 0.0)
                }
                .padding(.horizontal, 40)
                .padding(.bottom, 60)
            }
        }
        .onAppear {
            withAnimation(.spring(response: 0.8, dampingFraction: 0.7).delay(0.2)) {
                animateTitle = true
            }
            withAnimation(.spring(response: 0.8, dampingFraction: 0.7).delay(0.5)) {
                animateButton = true
            }
        }
    }
}
