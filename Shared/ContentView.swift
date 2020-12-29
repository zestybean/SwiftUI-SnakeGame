//
//  ContentView.swift
//  Shared
//
//  Created by Brando Lugo on 12/28/20.
//

import SwiftUI

//Snake direction enum
enum direction {
    case up, down, left, right
}

struct ContentView: View {
    //Start position of swipe
    @State var startPos:CGPoint = .zero
    
    //Did user start swipe?
    @State var isStarted = true
    
    //Game border end game
    @State var gameOver = false
    
    //Direction of the snake
    @State var dir = direction.down
    
    //Position array of the snakes body
    @State var snakePositionArray = [CGPoint(x: 0, y: 0)]
    
    //Position of the food
    @State var foodPosition = CGPoint(x: 0 , y: 0)
    
    //Width and height of the snake
    let snakeSize:CGFloat = 10
    
    //Update snake position 0.1 per sec
    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    
    
    
    var body: some View {
        Text("Hello, world!")
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
