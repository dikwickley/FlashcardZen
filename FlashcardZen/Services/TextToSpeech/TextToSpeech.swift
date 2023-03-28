//
//  TextToSpeechService.swift
//  FlashcardZen
//
//  Created by Aniket Rawat on 28/03/23.
//

import Foundation
import AVFoundation

class TextToSpeech: NSObject, ObservableObject {
    
    var synthesizer: AVSpeechSynthesizer
    var speakCompleteionHandler: (()->Void)?
    var didStop: Bool = false
    
    @Published var highlight: NSRange?
    @Published var isSpeaking: Bool = false
    
    override init(){
        synthesizer = AVSpeechSynthesizer()
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default, options: [.mixWithOthers, .allowAirPlay, .duckOthers])
            try AVAudioSession.sharedInstance().setActive(true)
        } catch {
            print(error)
        }
    }
    
    /// Converts text to speech and plays the audio
    /// - Parameter text: string to be converted to audio
    public func speak(text: String) {
        synthesizer.delegate = self
        
        let utterance = AVSpeechUtterance(string: text)
        utterance.voice = AVSpeechSynthesisVoice(language: "en-GB")
        utterance.rate = 0.5
        
        synthesizer.speak(utterance)
    }
    
    /// this functions takes in a closure that is fired when speech synthesis finishes
    /// - Parameter completion: closure function
    public func onCompleteteSpeak(completion: @escaping ()->Void) {
        speakCompleteionHandler = completion
    }
    
}
