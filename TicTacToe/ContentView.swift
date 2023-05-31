//
//  ContentView.swift
//  TicTacToe
//
//  Created by Muhamad Salman Hakim Alfarisi on 31/05/23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var gameState = GameState()
    var body: some View {
        Text(gameState.turnText())
            .font(.title)
            .bold()
            .padding()
        Spacer()
        
        Text(String(format: "Cross: %d", gameState.crossScore))
            .font(.title)
            .bold()
            .padding()
        
        let borderSize = CGFloat(5)
        VStack(spacing: borderSize) {
            ForEach(0...2, id: \.self) {
                row in
                HStack(spacing: borderSize) {
                    ForEach(0...2, id: \.self) {
                        col in
                        
                        let cell = gameState.board[row][col]
                        Text(cell.displayTile())
                            .font(.system(size: 60))
                            .foregroundColor(cell.tileColor())
                            .bold()
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .aspectRatio(1, contentMode: .fit)
                            .background(Color.white)
                            .onTapGesture {
                                gameState.placeTile(row, col)
                            }
                    }
                }
            }
        }
        .background(Color.black)
        .padding()
        .alert(isPresented: $gameState.showAlert) {
            Alert(title: Text(gameState.alertMessage), dismissButton: .default(Text("Oke 😋")) {
                gameState.resetBoard()
            })
        }
        Text(String(format: "Nought: %d", gameState.noughtScore))
            .font(.title)
            .bold()
            .padding()
        Spacer()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
