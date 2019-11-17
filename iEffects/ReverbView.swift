//
//  ReverbView.swift
//  iEffects
//
//  Created by Jeffrey Luo on 2019-11-16.
//  Copyright © 2019 Jeffrey Luo. All rights reserved.
//

import SwiftUI

struct ReverbView: View {
    
    @ObservedObject var audioRecorder = AudioRecorder()
    @ObservedObject var audioPlayer = AudioPlayer()
    @State private var wetness : Float = 50
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
                            Text("Wet Dry Mix")
                                .font(.headline)
                            Slider(value: $wetness, in: 0...100, step: 1)
                            Text("\(wetness, specifier: "%.f") % Wet")
                        }
                    }
                    if(audioPlayer.isPlaying == false) {
                        Button("Play Recording") {
                            self.audioPlayer.playAudioWithReverb(audio: self.audioRecorder.recordings[self.recording].fileURL, wetness: self.wetness)
                        }
                    }
                    else {
                            Button("Stop Recording") {
                                self.audioPlayer.stopPlayback()
                            }
                        }
                }
                .navigationBarTitle("Reverb")
            }
        }
    }

struct ReverbView_Previews: PreviewProvider {
    static var previews: some View {
        ReverbView()
    }
}
