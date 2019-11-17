//
//  DelayView.swift
//  iEffects
//
//  Created by Jeffrey Luo on 2019-11-17.
//  Copyright © 2019 Jeffrey Luo. All rights reserved.
//

import SwiftUI



struct DelayView: View {
    @ObservedObject var audioRecorder = AudioRecorder()
    @ObservedObject var audioPlayer = AudioPlayer()
    @State private var delayTime: TimeInterval = 1
    @State private var feedback: Float = 50
    @State private var lowPassCutoff: Float = 15000
    @State private var wetDryMix: Float = 50
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
                                Text("Time Interval amount")
                                    .font(.headline)
                                Slider(value: $delayTime, in: 0...2, step: 0.1)
                                Text("Your time interval is \(delayTime, specifier: "%.1f") seconds")
                            }
                            VStack {
                                Text("Feedback amount")
                                    .font(.headline)
                                Slider(value: $feedback, in: 0...100, step: 1)
                                Text("Your feedback amount is \(feedback, specifier: "%.f")%")
                            }
                            VStack {
                                Text("Cutoff Frequency")
                                    .font(.headline)
                                Slider(value: $lowPassCutoff, in: 10...15000, step: 10)
                                Text("Your cutoff frequency is \(lowPassCutoff, specifier: "%.f") Hz")
                            }
                            VStack {
                                Text("Wet Dry Mix")
                                    .font(.headline)
                                Slider(value: $wetDryMix, in: 0...100, step: 1)
                                Text("\(wetDryMix, specifier: "%.f") % Wet")
                            }
                        }
                        if(audioPlayer.isPlaying == false) {
                            Button("Play Recording") {
                                self.audioPlayer.playAudioWithDelay(audio: self.audioRecorder.recordings[self.recording].fileURL, delayTime: self.delayTime, feedback: self.feedback, lowPassCutoff: self.lowPassCutoff, wetDryMix: self.wetDryMix)
                            }
                        }
                        else {
                                Button("Stop Recording") {
                                    self.audioPlayer.stopPlayback()
                                }
                            }
                    }
                    .navigationBarTitle("Delay Effect")
                }
            }
        }

struct DelayView_Previews: PreviewProvider {
    static var previews: some View {
        DelayView()
    }
}
