//
//  PitchView.swift
//  iEffects
//
//  Created by Jeffrey Luo on 2019-11-15.
//  Copyright © 2019 Jeffrey Luo. All rights reserved.
//

import SwiftUI

struct PitchView: View {
    
    @ObservedObject var audioRecorder = AudioRecorder()
    @ObservedObject var audioPlayer = AudioPlayer()
    @State private var pitch : Float = 0
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
                        Text("Pitch shift amount")
                            .font(.headline)
                        Slider(value: $pitch, in: -2400...2400, step: 100)
                        Text("Your pitch shift is \(pitch, specifier: "%.f") cents")
                    }
                }
                if(audioPlayer.isPlaying == false) {
                    Button("Play Recording") {
                        self.audioPlayer.playAudioWithVariablePitch(audio: self.audioRecorder.recordings[self.recording].fileURL, pitch: self.pitch)
                    }
                }
                else {
                        Button("Stop Recording") {
                            self.audioPlayer.stopPlayback()
                        }
                    }
            }
            .navigationBarTitle("Pitch Effect")
        }
    }
}

struct PitchView_Previews: PreviewProvider {
    static var previews: some View {
        PitchView()
    }
}
