//
//  MainView.swift
//  TicTacToe
//
//  Created by Sal on 5/27/22.
//

import SwiftUI

struct MainView: View {
    @StateObject var gameVM = TicTacToeGame()
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
