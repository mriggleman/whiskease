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
                    Image("whiskylogo")
                        .resizable()
                        .edgesIgnoringSafeArea(.all)
                        .frame(width: 340, height: 318)
                        .cornerRadius(30)
                    NavigationLink(destination: PageView(choiceMade: .constant(0))) {
                        Text("I'm 21 or over!")
                    }
                    .buttonStyle(.borderedProminent)
                }
            }
        }.accentColor(.blue)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
