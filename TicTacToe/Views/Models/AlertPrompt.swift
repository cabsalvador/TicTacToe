//
//  AlertPrompt.swift
//  TicTacToe
//
//  Created by Sal on 5/27/22.
//

import Foundation

struct AlertPrompt: Equatable {
    var title: String
    var message: String
    var buttonTitle: String
}

extension AlertPrompt {
    static let player1 = AlertPrompt(title: "Player 1 Wins!", message: "Good job!", buttonTitle: "Play again.")
    static let player2 = AlertPrompt(title: "Player 1 Wins!", message: "Good job!", buttonTitle: "Play again.")
    static let tie =  AlertPrompt(title: "Player 1 Wins!", message: "Good job!", buttonTitle: "Play again.")
}
