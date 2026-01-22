//
//  PageView.swift
//  Whiskease
//
//  Created by Mark Riggleman on 4/8/23.
//

import SwiftUI

struct PageView: View {
    @Binding var choiceMade: Int
    
    var body: some View {
        
        let currentPage: Story = stories[choiceMade]
        
        NavigationStack{
            ZStack {
                Image("bluegrad")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    Text(currentPage.storyText)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .padding()
                    Image(currentPage.storyImage)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 340, height: 318)
                        .cornerRadius(30)

                }
                
                HStack {
                    if currentPage.choice1 != "N/A" {
                        // show the third choice
                        NavigationLink(destination: PageView(choiceMade: .constant(currentPage.choice1Destination))) {
                            Text(currentPage.choice1)
                        }
                        .buttonStyle(ChoiceButtonStyle(backgroundColor: .blue))
                    }
                    
                    
                    if currentPage.choice2 != "N/A" {
                        // show the third choice
                        NavigationLink(destination: PageView(choiceMade: .constant(currentPage.choice2Destination))) {
                            Text(currentPage.choice2)
                        }
                        .buttonStyle(ChoiceButtonStyle(backgroundColor: .blue))
                    }
                    
                    
                    if currentPage.choice3 != "N/A" {
                        // show the third choice
                        NavigationLink(destination: PageView(choiceMade: .constant(currentPage.choice3Destination))) {
                            Text(currentPage.choice3)
                        }
                        .buttonStyle(ChoiceButtonStyle(backgroundColor: .blue))
                    }
                    
                    
                    if currentPage.endOfStory {
                        //display the end
                        NavigationLink(destination: ContentView()) {
                            Text("Start Over")
                        }
                        .buttonStyle(ChoiceButtonStyle(backgroundColor: .blue))
                        
                        
                    }
                }
            }
        }
    }
}

struct ChoiceButtonStyle: ButtonStyle {
    var backgroundColor: Color
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(backgroundColor)
            .foregroundColor(.white)
            .cornerRadius(10)
            .font(.headline)
    }
}

struct PageView_Previews: PreviewProvider {
    static var previews: some View {
        PageView(choiceMade: .constant(1))
    }
}


