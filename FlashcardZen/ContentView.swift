//
//  ContentView.swift
//  FlashcardZen
//
//  Created by Aniket Rawat on 28/03/23.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var textToSpeech = TextToSpeech()
    @ObservedObject var player = Player()
    
    init() {
        textToSpeech.onCompleteteSpeak { [self] in
            if player.next() && player.autoplay {
                play()
            }
        }
    }
    
    func pause() {
        _ = textToSpeech.pause()
    }
    
    func play() {
        if textToSpeech.synthesizer.isPaused {
            _ = textToSpeech.play()
        } else {
            textToSpeech.speak(text: "\(player.nowPlaying.title). \(player.nowPlaying.content)")
        }
    }
    
    func stop() {
        textToSpeech.stop()
    }
    
    var body: some View {
        GeometryReader { proxy in
            let height = proxy.size.height
            let cardHeight = height * 1/2
            VStack {
                
                Spacer()
                
                VStack {
                    HStack {
                        Group {
                            Text("\(player.current + 1)")
                                .font(.largeTitle)
                                .bold() +
                            
                            Text("/\(player.playlist.count)")
                                .bold()
                                .foregroundColor(.gray)
                        }
                        Spacer()
                    }
                    
                    VStack {
                        
                        HStack {
                            Text(player.nowPlaying.title)
                                .font(.largeTitle)
                                .bold()
                            
                            Spacer()
                        }
                        
                        Text(player.nowPlaying.content)
//                        if let textToSpeech.highlight {
//                            highlightedText(text: player.nowPlaying.content, range: textToSpeech.highlight)
//                        } else {
//                            highlightedText(text: player.nowPlaying.content)
//                        }
                        
                        Spacer()
                        
                    }
                    .frame(maxHeight: cardHeight)
                    .padding()
                    .background(Color.app(.card))
                    .cornerRadius(20)
                    
                    controls
                        .background(Color.app(.offblack))
                        .cornerRadius(20)
                }
                .padding(.horizontal, 30)
                .padding(.vertical, 20)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.app(.bg))
        }
    }
    
    var controls: some View {
        HStack(spacing: 20) {
            Button {
                stop()
                _ = player.prev()
                play()
            } label: {
                Image(systemName: "backward.fill")
            }
            
            Spacer()
            
            Button {
                pause()
            } label: {
                Image(systemName: "pause.fill")
                
            }
            
            Button {
                play()
            } label: {
                Image(systemName: "play.fill")
            }
            
            Button {
                stop()
            } label: {
                Image(systemName: "stop.fill")
            }
            
            Spacer()
            
            Button {
                stop()
                _ = player.next()
                play()
            } label: {
                Image(systemName: "forward.fill")
            }
        }
        .font(.title)
        .padding()
    }
    
    @ViewBuilder
    func highlightedText(text str: String, range: NSRange = NSRange(location: 0, length: 0)) -> some View {
        
        let startIndex = range.location
        let endIndex = startIndex + range.length
        
        
        let firstRange = Range(NSRange(location: 0, length: startIndex), in: str)
        let secondRange = Range(range, in: str)
        let thirdRange = Range(NSRange(location: endIndex, length: str.count - endIndex), in: str)
        
        
        Group {
            Text(String(str[firstRange!]))
                .foregroundColor(Color.app(.text))
            +
            Text(String(str[secondRange!]))
                .foregroundColor(Color.accentColor)
            +
            Text(String(str[thirdRange!]))
                .foregroundColor(Color.app(.text))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
