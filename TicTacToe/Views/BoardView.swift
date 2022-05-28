//
//  BoardView.swift
//  TicTacToe
//
//  Created by Sal on 5/26/22.
//

import SwiftUI

struct BoardView: View {
    @StateObject var gameVM = TicTacToeGame()
    
    
    var body: some View {
        let spacing: CGFloat = 6
        let columns: [GridItem] = Array(repeating: .init(.flexible(minimum: 50), spacing: 0), count: 3)
        VStack {
            
            HStack {
                Text("Player 1: \(gameVM.player1.score)")
                    .fontWeight(gameVM.selectedPlayer == 0 || gameVM.gameOver ? .bold : .regular)
                    .padding(10)
                    .padding(.horizontal)
                    .background(RoundedRectangle(cornerRadius: 5).foregroundColor(gameVM.selectedPlayer == 0 || gameVM.gameOver ? gameVM.player1.color : .background).shadow(radius: 2).opacity(0.2))
                    .foregroundColor(gameVM.selectedPlayer == 0 || gameVM.gameOver ? gameVM.player1.color : .secondary)
                    
                Text("Player 2: \(gameVM.player2.score)")
                    .fontWeight(gameVM.selectedPlayer == 1 || gameVM.gameOver ? .bold : .regular)
                    .padding(10)
                    .padding(.horizontal)
                    .background(RoundedRectangle(cornerRadius: 5).foregroundColor(gameVM.selectedPlayer == 1 || gameVM.gameOver ? gameVM.player2.color : .background).shadow(radius: 2).opacity(0.2))
                    .foregroundColor(gameVM.selectedPlayer == 1 || gameVM.gameOver ? gameVM.player2.color : .secondary)
            }
            
            LazyVGrid(columns: columns, spacing: 0) {
                ForEach(0..<gameVM.board.count, id: \.self) { idx in
                    Button(action: { gameVM.choose(index: idx) }) {
                        Image(systemName: gameVM.board[idx]?.sfSymbol ?? "")
                            .resizable()
                            .scaledToFit()
                            .padding()
                    }
                    .buttonStyle(.bordered)
                    .padding(spacing)
                    .tint(gameVM.board[idx]?.color ?? .gray)
                    .disabled(gameVM.gameOver)
                }
            }
            .padding(5)
            .background(RoundedRectangle(cornerRadius: 15).foregroundColor(.background).shadow(radius: 5)).padding(5)
            
            Button("New Game") {
                gameVM.newGame()
            }
            .buttonStyle(.bordered)
            .tint(.green)
            .controlSize(.large)
            
            Button("Game Tie") {
                gameVM.showOutcome = true
            }
            .buttonStyle(.bordered)
            .tint(.red)
            .controlSize(.large)
        }
        .padding(spacing)
//        .alert(gameVM.alertPromt.title, isPresented: $gameVM.showOutcome) {
//            Text(gameVM.alertPromt.buttonTitle)
//        } message: {
//            Text(gameVM.alertPromt.message)
//        }
        
        
    }
}

struct BoardView_Previews: PreviewProvider {
    static var previews: some View {
        BoardView()
    }
}
