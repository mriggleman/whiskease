//
//  ContentView.swift
//  Whiskease
//
//  Created by Mark Riggleman on 4/8/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Image("bluegrad")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                VStack{
                    Text("Whis-key")
                        .font(.largeTitle)
                        .multilineTextAlignment(.center)
                    Text("Unlock the world of whiskies!")
                        .font(.headline)
                    NavigationLink(destination: PageView(choiceMade: .constant(0))) {
                        Text("I'm 21 or over!")
                    }
                    .buttonStyle(.borderedProminent)
                }
            }
        }.accentColor(.black)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
