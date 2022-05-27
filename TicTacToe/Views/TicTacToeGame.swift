//
//  TicTacToeGame.swift
//  TicTacToe
//
//  Created by Sal on 5/26/22.
//

import Foundation

final class TicTacToeGame: ObservableObject {
    @Published var game: Game
    @Published private(set) var players = [
        Player(color: .red, sfSymbol: "circle"),
        Player(color: .blue, sfSymbol: "xmark")
    ]
    
    init() {
        game = Game()
    }
    
    var board: [GamePiece?] {
        game.board
    }
    
    var selectedPlayer: Int {
        game.selectedPlayer
    }
    
    // MARK - Functions
    
    func choose(index: Int) {
        // Check if board space is empty
        guard game.isIndexEmpty(at: index) else { return }
        
        // Choose the board space.
        let gamepiece = GamePiece(sfSymbol: players[selectedPlayer].sfSymbol, color: players[selectedPlayer].color)
        game.choose(at: index, gamepiece)
    }
}
