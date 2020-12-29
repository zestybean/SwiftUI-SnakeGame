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
    
    //Bounds of the given screen
    let minX = UIScreen.main.bounds.minX
    let maxX = UIScreen.main.bounds.maxX
    let minY = UIScreen.main.bounds.minY
    let maxY = UIScreen.main.bounds.maxY
    
    //Func determines the position of our rectangles
    func changeRectPos() -> CGPoint {
        let rows = Int(maxX/snakeSize)
        let cols = Int(maxY/snakeSize)
        
        let randomX = Int.random(in: 1..<rows) * Int(snakeSize)
        let randomY = Int.random(in: 1..<cols) * Int(snakeSize)
        
        return CGPoint(x: randomX, y: randomY)
    }
    
    
    var body: some View {
        ZStack{
            Color.pink.opacity(0.3)
            ZStack{
                ForEach(0..<snakePositionArray.count, id:\.self) { index in
                    Rectangle()
                        .frame(width: self.snakeSize, height: self.snakeSize)
                        .position(self.snakePositionArray[index])
                }
                Rectangle()
                    .fill(Color.red)
                    .frame(width: snakeSize, height: snakeSize)
                    .position(foodPosition)
            }
        }
        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
        .onAppear() {
            self.foodPosition = self.changeRectPos()
            self.snakePositionArray[0] = self.changeRectPos()
        }
        
        //Draw game over
        if self.gameOver {
            Text("Game Over")
        }
    }
}









struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
