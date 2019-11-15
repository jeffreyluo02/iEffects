//
//  AudioPlayer.swift
//  iEffects
//
//  Created by Jeffrey Luo on 2019-11-12.
//  Copyright © 2019 Jeffrey Luo. All rights reserved.
//

import Foundation
import SwiftUI
import AVFoundation

class AudioPlayer: NSObject, ObservableObject, AVAudioPlayerDelegate {
    
    @Published var isPlaying = false
    
    var audioEngine: AVAudioEngine!
    var audioFile: AVAudioFile!
    
    // plays the audio without any manipulation
    func startPlayBack(audio: URL) {
        do {
            // setup audio player with file
            audioEngine = AVAudioEngine()
            audioFile = try AVAudioFile(forReading: audio)
        } catch {
            print("Setting up playAudio failed.")
        }
        // reset the audio engine
        audioEngine.stop()
        audioEngine.reset()
        
        let audioPlayerNode = AVAudioPlayerNode()
        
        audioEngine.attach(audioPlayerNode)
        
        audioEngine.connect(audioPlayerNode, to: audioEngine.outputNode, format: nil)
        
        audioPlayerNode.scheduleFile(audioFile, at: nil, completionHandler: nil)
        do {
            try audioEngine.start()
        } catch {
            print("playAudio audioEngine could not be started")
        }
        audioPlayerNode.play()
        
        isPlaying = true
    }
    
    // NOTE: This won't show if the audio is finished playing or not
    func playAudioWithVariablePitch(audio: URL, pitch: Float) {
        do {
            // setup audio player with file
            audioEngine = AVAudioEngine()
            audioFile = try AVAudioFile(forReading: audio)
        } catch {
            print("Setting up pitch change failed.")
        }
        // reset the audio engine
        audioEngine.stop()
        audioEngine.reset()
        
        let audioPlayerNode = AVAudioPlayerNode()
        
        audioEngine.attach(audioPlayerNode)
        
        let changePitchEffect = AVAudioUnitTimePitch()
        changePitchEffect.pitch = pitch
        audioEngine.attach(changePitchEffect)
        
        audioEngine.connect(audioPlayerNode, to: changePitchEffect, format: nil)
        audioEngine.connect(changePitchEffect, to: audioEngine.outputNode, format: nil)
        
        audioPlayerNode.scheduleFile(audioFile, at: nil, completionHandler: nil)
        do {
            try audioEngine.start()
        } catch {
            print("Pitch shift audioEngine could not be started")
        }
        audioPlayerNode.play()
        
        isPlaying = true
    }
    
    
    func playAudioWithReverb(audio: URL, wetness: Float) {
        do {
            // setup audio player with file
            audioEngine = AVAudioEngine()
            audioFile = try AVAudioFile(forReading: audio)
        } catch {
            print("Setting up pitch change failed.")
        }
        // reset the audio engine
        audioEngine.stop()
        audioEngine.reset()
        
        let audioPlayerNode = AVAudioPlayerNode()
        
        audioEngine.attach(audioPlayerNode)
        
        let reverbEffect = AVAudioUnitReverb()
        reverbEffect.wetDryMix = wetness
        audioEngine.attach(reverbEffect)
        
        audioEngine.connect(audioPlayerNode, to: reverbEffect, format: nil)
        audioEngine.connect(reverbEffect, to: audioEngine.outputNode, format: nil)
        
        audioPlayerNode.scheduleFile(audioFile, at: nil, completionHandler: nil)
        do {
            try audioEngine.start()
        } catch {
            print("Pitch shift audioEngine could not be started")
        }
        audioPlayerNode.play()
        
        isPlaying = true
    }
    
    func stopPlayback() {
        if(audioEngine.isRunning) {
            audioEngine.stop()
            audioEngine.reset()
        }
        isPlaying = false
    }
}
