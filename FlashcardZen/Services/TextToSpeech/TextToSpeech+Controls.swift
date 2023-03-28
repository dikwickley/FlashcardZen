//
//  TextToSpeech+Controls.swift
//  FlashcardZen
//
//  Created by Aniket Rawat on 28/03/23.
//

import Foundation
import AVFoundation

extension TextToSpeech {
    
    func play() -> Bool {
        if synthesizer.isPaused {
            synthesizer.continueSpeaking()
            
            return true
        }
        return false
    }
    
    func pause() -> Bool {
        if synthesizer.isSpeaking {
            synthesizer.pauseSpeaking(at: .immediate)
            return true
        }
        return false
    }
    
    func stop() {
        // adding an additional didStop flag as stopSpeaking(at:) is not triggering
        // speechSynthesizer(_:didCancel:) in speech delegate
        // instead it is triggering speechSynthesizer(_:didFinish:)
        didStop = true
        synthesizer.stopSpeaking(at: .immediate)
    }
}
