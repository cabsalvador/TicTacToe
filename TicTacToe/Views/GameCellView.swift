//
//  GameCellView.swift
//  TicTacToe
//
//  Created by Sal on 5/26/22.
//

import SwiftUI

struct GameCellView: View {
    var systemName: String
    var body: some View {
        ZStack {
            Circle()
                .strokeBorder(lineWidth: 2)
            Image(systemName: systemName)
                .font(.largeTitle)
        }
    }
}

struct GameCellView_Previews: PreviewProvider {
    @State static var name: String = "xmark"
    static var previews: some View {
        Button {
            name = "circle"
        } label: {
            GameCellView(systemName: name)
                .frame(width: 120, height: 120)
        }
    }
}
