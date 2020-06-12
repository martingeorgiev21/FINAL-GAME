//
//  MusicPlayer.swift
//  Martogame
//
//  Created by MyMac on 09/02/2020.
//  Copyright © 2020 Martogame. All rights reserved.
//

import UIKit
import Foundation
import AVFoundation

class MusicPlayer: UIImageView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
        static let shared = MusicPlayer()
        var audioPlayer: AVAudioPlayer?

        func startBackgroundMusic() {
            if let bundle = Bundle.main.path(forResource: "soundName", ofType: "mp3") {
                let backgroundMusic = NSURL(fileURLWithPath: bundle)
                do {
                    audioPlayer = try AVAudioPlayer(contentsOf:backgroundMusic as URL)
                    guard let audioPlayer = audioPlayer else { return }
                    audioPlayer.numberOfLoops = -1
                    audioPlayer.prepareToPlay()
                    audioPlayer.play()
                } catch {
                    print(error)
                }
            }
        }
    }
