//
//  ContentView.swift
//  Memorize
//
//  Created by Kevin Gracia on 17/02/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack(content: {
            CardView(isFaceUp: true)
            CardView(isFaceUp: true)
            CardView(isFaceUp: false)
            CardView(isFaceUp: true)
        })
      
        .foregroundColor(.orange)
        .padding()
    }
}

struct CardView: View {
    @State var isFaceUp: Bool = false
    var body: some View {
        ZStack {
            let base = Circle()
            if isFaceUp {
               base.fill(.white)
               base.strokeBorder(lineWidth: /*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/)
                Text("🏂").font(.largeTitle)
            } else {
                base.fill()
            }
        }
        .onTapGesture {
            //isFaceUp = !isFaceUp
            isFaceUp.toggle()
        }
    }
}

#Preview {
    ContentView()
}
