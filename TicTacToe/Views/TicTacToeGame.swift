//
//  TicTacToeGame.swift
//  TicTacToe
//
//  Created by Sal on 5/26/22.
//

import Foundation

final class TicTacToeGame: ObservableObject {
    @Published var game: Game
    @Published var showOutcome = false
    
    init() {
        let player1 = Player(color: .yellow, sfSymbol: "xmark")
        let player2 = Player(color: .green, sfSymbol: "circle")
        game = Game(player1: player1, player2: player2)
    }
    
    var board: [GamePiece?] {
        game.board
    }
    
    var selectedPlayer: Int {
        game.selectedPlayer
    }
    
    var players: [Player] {
        game.players
    }
    
    var player1: Player {
        game.player1
    }
    
    var player2: Player {
        game.player2
    }
    
    var gameOver: Bool {
        game.gameOver
    }
    
//    var alertPrompt: AlertPrompt {
//        if let outcome = game.outcome {
//            switch outcome {
//            case .player1Wins:
//                return AlertPrompt.player1
//            case .player2Wins:
//                return AlertPrompt.player2
//            case .tie:
//                return AlertPrompt.tie
//            }
//        }
//        return
//    }
    
    // MARK - Functions
    
    func choose(index: Int) {
        // Check if board space is empty
        guard game.isIndexEmpty(at: index) else { return }
        
        // Choose the board space.
        let gamepiece = GamePiece(id: index,
                                  sfSymbol: players[selectedPlayer].sfSymbol,
                                  color: players[selectedPlayer].color)
        game.choose(at: index, gamepiece)
    }
    
    func newGame() {
        game.newGame()
    }
}
