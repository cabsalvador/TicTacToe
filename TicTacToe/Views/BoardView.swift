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
                }
            }
            
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
        .alert(gameVM.alertPromt.title, isPresented: $gameVM.showOutcome) {
            Text(gameVM.alertPromt.buttonTitle)
        } message: {
            Text(gameVM.alertPromt.message)
        }
        
        
    }
}

struct BoardView_Previews: PreviewProvider {
    static var previews: some View {
        BoardView()
    }
}
