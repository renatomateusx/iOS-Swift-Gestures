//
//  ContentView.swift
//  SwiftUI Gestures
//
//  Created by Renato Mateus on 09/02/21.
//

import SwiftUI

struct ContentView: View {
    @GestureState var isLongPressed = false
    
    @State var offset: CGSize = .zero
    
    var body: some View {
    
        let longPressGesture = LongPressGesture()
            .updating($isLongPressed){
                newValue, state, transaction in state = newValue
            }
        let dragGesture = DragGesture()
            .onChanged{value in self.offset = value.translation}
        
        VStack {
            Circle()
                .frame(width:150, height: 150, alignment: .center)
                .foregroundColor(isLongPressed ? .orange : .red)
                .scaleEffect(isLongPressed ? 2 : 1)
                .offset(x: offset.width, y: offset.height)
                .gesture(longPressGesture)
                .animation(.spring())
        }
                
        VStack {
            Circle()
                .frame(width:150, height: 150, alignment: .center)
                .foregroundColor(.blue)
                .offset(x: offset.width, y: offset.height)
                .gesture(dragGesture)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 12")
    }
}
