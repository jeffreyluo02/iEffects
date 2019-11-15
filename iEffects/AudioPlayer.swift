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
    
    // pitch change
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
    
    // reverb effect
    func playAudioWithReverb(audio: URL, wetness: Float) {
        do {
            // setup audio player with file
            audioEngine = AVAudioEngine()
            audioFile = try AVAudioFile(forReading: audio)
        } catch {
            print("Setting up reverb failed.")
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
            print("Reverb audioEngine could not be started")
        }
        audioPlayerNode.play()
        
        isPlaying = true
    }
    
    // an echo effect
    func playAudioWithDelay(audio: URL, delayTime: TimeInterval, feedback: Float, lowPassCutoff: Float, wetDryMix: Float) {
        do {
            // setup audio player with file
            audioEngine = AVAudioEngine()
            audioFile = try AVAudioFile(forReading: audio)
        } catch {
            print("Setting up delay failed.")
        }
        // reset the audio engine
        audioEngine.stop()
        audioEngine.reset()
        
        let audioPlayerNode = AVAudioPlayerNode()
        
        audioEngine.attach(audioPlayerNode)
        
        let delayEffect = AVAudioUnitDelay()
        
        delayEffect.delayTime = delayTime
        delayEffect.feedback = feedback
        delayEffect.lowPassCutoff = lowPassCutoff
        delayEffect.wetDryMix = wetDryMix
        
        audioEngine.attach(delayEffect)
        
        audioEngine.connect(audioPlayerNode, to: delayEffect, format: nil)
        audioEngine.connect(delayEffect, to: audioEngine.outputNode, format: nil)
        
        audioPlayerNode.scheduleFile(audioFile, at: nil, completionHandler: nil)
        do {
            try audioEngine.start()
        } catch {
            print("Delay effect audioEngine could not be started")
        }
        audioPlayerNode.play()
        
        isPlaying = true
    }
    
    func playAudioWithSpeedChange(audio: URL, rate: Float) {
        do {
            // setup audio player with file
            audioEngine = AVAudioEngine()
            audioFile = try AVAudioFile(forReading: audio)
        } catch {
            print("Setting up speed change failed.")
        }
        // reset the audio engine
        audioEngine.stop()
        audioEngine.reset()
        
        let audioPlayerNode = AVAudioPlayerNode()
        
        audioEngine.attach(audioPlayerNode)
        
        let speedEffect = AVAudioUnitVarispeed()
        speedEffect.rate = rate
        audioEngine.attach(speedEffect)
        
        audioEngine.connect(audioPlayerNode, to: speedEffect, format: nil)
        audioEngine.connect(speedEffect, to: audioEngine.outputNode, format: nil)
        
        audioPlayerNode.scheduleFile(audioFile, at: nil, completionHandler: nil)
        do {
            try audioEngine.start()
        } catch {
            print("Speed effect audioEngine could not be started")
        }
        audioPlayerNode.play()
        
        isPlaying = true
    }
    
    // distortion effect
    func playAudioWithUnitDistortion(audio: URL, preGain: Float, wetDryMix: Float) {
        do {
            // setup audio player with file
            audioEngine = AVAudioEngine()
            audioFile = try AVAudioFile(forReading: audio)
        } catch {
            print("Setting up distortion failed.")
        }
        // reset the audio engine
        audioEngine.stop()
        audioEngine.reset()
        
        let audioPlayerNode = AVAudioPlayerNode()
        
        audioEngine.attach(audioPlayerNode)
        
        let distortionEffect = AVAudioUnitDistortion()
        distortionEffect.preGain = preGain
        distortionEffect.wetDryMix = wetDryMix
        audioEngine.attach(distortionEffect)
        
        audioEngine.connect(audioPlayerNode, to: distortionEffect, format: nil)
        audioEngine.connect(distortionEffect, to: audioEngine.outputNode, format: nil)
        
        audioPlayerNode.scheduleFile(audioFile, at: nil, completionHandler: nil)
        do {
            try audioEngine.start()
        } catch {
            print("Distortion audioEngine could not be started")
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
