//
//  Game.swift
//  TicTacToe
//
//  Created by Sal on 5/26/22.
//

import Foundation
import SwiftUI

struct Game {
    private(set) var selectedPlayer: Int
    private(set) var board: [GamePiece?]
    private(set) var players: [Player] = []
    private(set) var outcome: Outcome?
    private(set) var totalMoves = 0
    private(set) var gameOver = false
    private let winningConditions: [Set] = [
        [0, 1, 2], [3, 4, 5], [6, 7, 8], // Horizontal win conditions
        [0, 3, 6], [1, 4, 7], [3, 5, 8], // Veritical win conditions
        [0, 4, 8], [2, 4, 6]             // Diagonal win conditiions
    ]
    
    init(player1: Player = Player(color: .red, sfSymbol: "xmark"), player2: Player = Player(color: .blue, sfSymbol: "circle")) {
        board = Array(repeating: nil, count: 9)
        self.players.append(player1)
        self.players.append(player2)
        selectedPlayer = 0
    }
    
    var player1: Player {
        players[0]
    }
    
    var player2: Player {
        players[1]
    }
    
    private mutating func toggleNextPlayer() {
        selectedPlayer += 1
        if players.count <= selectedPlayer {
            selectedPlayer = 0
        }
    }
    
    mutating func choose(at index: Int, _ gamePiece: GamePiece) {
        // Check board space is empty (available to select)
        guard isIndexEmpty(at: index) else { return }
        board[index] = gamePiece
        totalMoves += 1
        // Enough moves have been played for a potential win.
        checkForOutcome()
        toggleNextPlayer()
    }
    
    mutating func checkForOutcome() {
        if totalMoves >= 5 {
            if checkWinConditions() {
                players[selectedPlayer].score += 1
                gameOver = true
                print("Player \(selectedPlayer + 1) wins!")
            }
            if outcomeIsTie() {
                outcome = .tie
                gameOver = true
                print("Tie. Try again.")
            }
        }
    }
    
    func isIndexEmpty(at index: Int) -> Bool {
        guard board[index] == nil else {
            return false
        }
        return true
    }
    
    mutating func newGame() {
        board = Array(repeating: nil, count: 9)
        selectedPlayer = 0
        gameOver = false
    }
    
    func checkWinConditions() -> Bool {
        // Filter all gamepieces in play of the current player, then filter the id's of the pieces.
        let filteredBoard = Set(board.filter { $0?.sfSymbol == players[selectedPlayer].sfSymbol }.compactMap { $0?.id })
        
        // Check for a win after the current player has played more than 3 moves.
        for condition in winningConditions {
            // Match found
            if condition.isSubset(of: filteredBoard) {
                return true
            }
        }
        return false
    }
    
    private func outcomeIsTie() -> Bool {
        // No spots remain
        guard board.filter({ $0 == nil }).count == 0 else { return false }
        return true
    }
    
    private mutating func results() {
        players[selectedPlayer].score += 1
    }
}
