//
//  ContentView.swift
//  Memorize
//
//  Created by Andres Marquez on 2021-09-22.
//

import SwiftUI

struct ContentView: View {
    let travelEmojis = ["🚀", "🚗", "🚌", "🛳", "🚕", "🚞", "🚢", "🚝", "🚁", "🛶", "🛻", "🚔", "⛵️", "🚟", "🚡", "🛵", "🛴", "🚲", "🦼", "🦽", "🚐", "🏎", "🛸", "🚂"]
    let sportEmojis = ["⚽️", "🏀", "🏈", "⚾️", "🎾", "🏐", "🏉", "🥏", "🎱", "🪀", "🏓", "🏸", "🏒", "🏑", "🥍", "🏏", "🪃", "🥅", "⛳️", "🪁", "🏹", "🎣", "🤿", "🥊"]
    let foodEmojis = ["🍏", "🍎", "🍐", "🍊", "🍌", "🍉", "🍇", "🍓", "🍈", "🍑", "🥐", "🥨", "🧀", "🥚", "🥞", "🥓", "🥩", "🍗", "🌭", "🍔", "🍟", "🍕", "🍝"]
    @State var emojis = ["🚀", "🚗", "🚌", "🛳", "🚕", "🚞", "🚢", "🚝", "🚁", "🛶", "🛻", "🚔", "⛵️", "🚟", "🚡", "🛵", "🛴", "🚲", "🦼", "🦽", "🚐", "🏎", "🛸", "🚂"].shuffled()
    @State var emojiCount = 14
    
    var body: some View {
        VStack {
            Text("Memorize!")
                .font(.largeTitle)
                .bold()
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                    ForEach(emojis[0..<emojiCount], id: \.self) { emoji in
                        CardView(content: emoji).aspectRatio(2/3, contentMode: .fit)
                    }
                }
                .foregroundColor(.red)
            }
            Spacer()
            HStack {
                remove
                Spacer()
                change(title: "Vehicle", type: travelEmojis, buttonImage: "airplane")
                Spacer()
                change(title: "Sports", type: sportEmojis, buttonImage: "sportscourt")
                Spacer()
                change(title: "Food", type: foodEmojis, buttonImage: "hare")
                Spacer()
                add
            }
            .font(.largeTitle)
            .padding(.horizontal)
        }
        .padding(.horizontal)
    }
    
    var remove: some View {
        Button {
            if emojiCount > 1 {
                emojiCount -= 1
            }
        } label: {
            Image(systemName: "minus.circle")
        }
    }
    
    var add: some View {
        Button {
            if emojiCount < emojis.count {
                emojiCount += 1
            }
        } label: {
            Image(systemName: "plus.circle")
        }
    }
    
    func change(title: String, type: [String], buttonImage: String) -> some View {
        return VStack {
            Button {
                emojis = type.shuffled()
            } label: {
                Image(systemName: buttonImage)
            }
            Text(title)
                .font(.footnote)
                .foregroundColor(.blue)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct CardView: View {
    var content: String
    @State var isFaceUp: Bool = true
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if isFaceUp {
                    shape.fill().foregroundColor(.white)
                    shape.strokeBorder(lineWidth: 3)
                    Text(content)
                        .font(.largeTitle)
            } else {
                shape.fill()
            }
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}
