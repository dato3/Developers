//
//  SoundPlayer.swift
//  Developers
//
//  Created by Daulet on 21.11.2021.
//

import Foundation
import AVFoundation

var audioPlayer: AVAudioPlayer?

func playSound() {
    if let path = Bundle.main.path(forResource: "sound-chime", ofType: "mp3") {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            audioPlayer?.play()
        } catch {
            print("Could not find and play the sound file.")
        }
    }
}

