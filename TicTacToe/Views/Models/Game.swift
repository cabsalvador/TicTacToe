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
    private(set) var numberOfPlayers: Int
    private let winningConditions = [
        [0, 1, 2], [3, 4, 5], [6, 7, 8], // Horizontal win conditions
        [0, 3, 6], [1, 4, 7], [3, 5, 8], // Veritical win conditions
        [0, 4, 8], [2, 4, 6]             // Diaganol win conditiions
    ]
    
    init() {
        board = Array(repeating: nil, count: 9)
        numberOfPlayers = 2
        selectedPlayer = 0
    }
    
    private mutating func toggleNextPlayer() {
        selectedPlayer += 1
        if numberOfPlayers <= selectedPlayer {
            selectedPlayer = 0
        }
    }
    
    mutating func choose(at index: Int, _ gamePiece: GamePiece) {
        if isIndexEmpty(at: index) {
            board[index] = gamePiece
            toggleNextPlayer()
        }
    }
    
    func isIndexEmpty(at index: Int) -> Bool {
        guard board[index] == nil else {
            return false
        }
        return true
    }
}
