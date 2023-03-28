//
//  Player.swift
//  FlashcardZen
//
//  Created by Aniket Rawat on 28/03/23.
//

import Foundation

class Player: ObservableObject {
    
    @Published var current = 0
    var autoplay = true
    var playlist = Store.shared.flashcards
    var nowPlaying: Flashcard {
        playlist[current]
    }
    
    func next() -> Bool {
        if current < playlist.count - 1 {
            current += 1
            return true
        }
        return false
    }
    
    func prev() -> Bool {
        if current > 0 {
            current -= 1
            return true
        }
        return false
    }
}
