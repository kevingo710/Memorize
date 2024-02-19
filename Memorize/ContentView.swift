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
            let emojis: Array<String> = ["🏂", "🏔️", "❄️", "⛷️", "⛷️"];
            ForEach(emojis.indices, id: \.self){
                index in CardView(content: emojis[index])
            }

        })
      
        .foregroundColor(.orange)
        .padding()
    }
}

struct CardView: View {
    let content: String
    @State var isFaceUp: Bool = false
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            if isFaceUp {
               base.fill(.white)
               base.strokeBorder(lineWidth: /*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/)
                Text(content).font(.largeTitle)
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
