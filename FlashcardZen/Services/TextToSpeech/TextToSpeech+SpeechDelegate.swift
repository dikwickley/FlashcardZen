//
//  TextToSpeech+SpeechDelegate.swift
//  FlashcardZen
//
//  Created by Aniket Rawat on 28/03/23.
//

import Foundation
import AVFoundation

extension TextToSpeech: AVSpeechSynthesizerDelegate {
    
    func speechSynthesizer(
        _ synthesizer: AVSpeechSynthesizer,
        willSpeakRangeOfSpeechString characterRange: NSRange,
        utterance: AVSpeechUtterance
    ) {
        highlight = characterRange
    }
    
    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didFinish utterance: AVSpeechUtterance) {
        highlight = nil
        
        if didStop {
            return
        }
        
        if let speakCompleteionHandler {
            speakCompleteionHandler()
        }
    }
    
    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didCancel: AVSpeechUtterance) {
        highlight = nil
    }
    
}
