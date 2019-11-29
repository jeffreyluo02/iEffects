//
//  SpeedView.swift
//  iEffects
//
//  Created by Jeffrey Luo on 2019-11-20.
//  Copyright © 2019 Jeffrey Luo. All rights reserved.
//

import SwiftUI

struct SpeedView: View {
    @ObservedObject var audioRecorder = AudioRecorder()
    @ObservedObject var audioPlayer = AudioPlayer()
    @State private var rate : Float = 1.0
    @State private var recording = 0
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Choose Recording")) {
                    Picker("Recording", selection: $recording) {
                        ForEach(0 ..< audioRecorder.recordings.count) { recording in
                            Text(self.audioRecorder.recordings[recording].fileURL.lastPathComponent)
                        }
                    }
                }
                Section(header: Text("Edit values")) {
                    // edit the variables here
                    VStack {
                        Text("Playback rate")
                            .font(.headline)
                        Slider(value: $rate, in: 0.25...4, step: 0.05)
                        Text("Your playback rate is \(rate, specifier: "%.02f")x")
                    }
                    
                }
                if(audioPlayer.isPlaying == false) {
                    Button("Play Recording") {
                        self.audioPlayer.playAudioWithSpeedChange(audio: self.audioRecorder.recordings[self.recording].fileURL, rate: self.rate)
                    }
                }
                else {
                    Button("Stop Recording") {
                        self.audioPlayer.stopPlayback()
                    }
                }
            }
            .navigationBarTitle("Speed Change")
        }
    }
}

struct SpeedView_Previews: PreviewProvider {
    static var previews: some View {
        SpeedView()
    }
}
