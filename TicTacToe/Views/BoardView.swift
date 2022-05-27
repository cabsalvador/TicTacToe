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
        
        let columns: [GridItem] = Array(repeating: .init(.flexible(minimum: 50), spacing: 0), count: 3)
        LazyVGrid(columns: columns, spacing: 0) {
            ForEach(0..<gameVM.board.count, id: \.self) { idx in
                Button(action: { gameVM.choose(index: idx) }) {
                    Image(systemName: gameVM.board[idx]?.sfSymbol ?? "")
                        .resizable()
                        .scaledToFit()
                        .padding()
                    
                }
                .buttonStyle(.bordered)
                .padding(5)
                .tint(gameVM.board[idx] == nil ? .gray : gameVM.board[idx]?.color)
            }
        }
    }
}

struct BoardView_Previews: PreviewProvider {
    static var previews: some View {
        BoardView()
    }
}
