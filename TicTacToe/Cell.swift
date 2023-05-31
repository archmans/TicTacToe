//
//  Cell.swift
//  TicTacToe
//
//  Created by Muhamad Salman Hakim Alfarisi on 31/05/23.
//

import Foundation
import SwiftUI

struct Cell {
    var tile: Tile
    
    func displayTile() -> String {
        switch(tile) {
            case Tile.Nought:
                return "🥶"
            case Tile.Cross:
                return "🥵"
            default:
                return ""
        }
    }
    
    func tileColor() -> Color {
        switch(tile) {
            case Tile.Nought:
                return Color.blue
            case Tile.Cross:
                return Color.red
            default:
                return Color.red
        }
        
    }
}

enum Tile {
    case Nought
    case Cross
    case Empty
}
