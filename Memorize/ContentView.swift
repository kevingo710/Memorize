//
//  ContentView.swift
//  Memorize
//
//  Created by Kevin Gracia on 17/02/24.
//

import SwiftUI

struct ContentView: View {
    let emojis: Array<String> = ["🏂", "🏔️", "❄️", "⛷️", "⛷️", "⛷️", "⛷️", "⛷️", "⛷️", "⛷️"];
    

    @State var cardCount: Int = 4
    
    var body: some View {
        VStack(content: {
            ScrollView{
                cards
            }
            Spacer()
            cardCountAdjuster
        })
        .padding()
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120 ))]){
            ForEach(0..<cardCount, id: \.self){
                index in 
                CardView(content: emojis[index]).aspectRatio( 2/3 ,contentMode: .fit)
            }
        }
        .foregroundColor(.orange)
    }
    
    var cardCountAdjuster: some View {
        HStack {
            cardRemover

            Spacer()
            
            cardAdder

        }
        
    }
    
    
    func cardCountAdjuster(by offset: Int, symbol: String ) -> some View {
        Button(action: {
            cardCount += offset
        }, label: {
            Image(systemName: symbol)
        })
        .imageScale(.large)
        .font(.largeTitle)
        .disabled(cardCount + offset < 1 || cardCount + offset > emojis.count)
    }
    
    var cardRemover: some View {
        cardCountAdjuster(by: -1, symbol: "rectangle.stack.fill.badge.minus")
    }
    
    var cardAdder: some View {
        cardCountAdjuster(by: +1, symbol: "rectangle.stack.fill.badge.plus")
    }
}

struct CardView: View {
    let content: String
    @State var isFaceUp: Bool = true
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            Group {
               base.fill(.white)
               base.strokeBorder(lineWidth: /*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/)
                Text(content).font(.largeTitle)
            }
            .opacity(isFaceUp ? 1 : 0 )
            base.fill().opacity(isFaceUp ? 0 : 1)
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
