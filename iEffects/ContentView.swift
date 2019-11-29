//
//  ContentView.swift
//  iEffects
//
//  Created by Jeffrey Luo on 2019-11-12.
//  Copyright © 2019 Jeffrey Luo. All rights reserved.
//

import SwiftUI

struct ContentView: View {

    @ObservedObject var audioRecorder : AudioRecorder
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [.gray, .white]), startPoint: .bottom, endPoint: .top).edgesIgnoringSafeArea(.all)
                
                VStack(spacing: 100) {
                    Text("iEffects")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    
                    VStack(spacing: 10) {
                        // Display different buttons depending on if we are currently recording or not
                        if audioRecorder.recording == false {
                            Button(action: {
                                self.audioRecorder.startRecording()
                            }) {
                                Image(systemName: "mic.circle")
                                    .renderingMode(.original)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 180, height: 180)
                                    .clipShape(Capsule())
                                    .shadow(color: .white, radius: 2)
                            }
                        }
                        else {
                            Button(action: {
                                self.audioRecorder.stopRecording()
                            }) {
                                Image(systemName: "stop.circle")
                                    .renderingMode(.original)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 180, height: 180)
                                    .clipShape(Capsule())
                                    .shadow(color: .white, radius: 2)
                            }
                        }
                        // Display "Record" if not recording, and display "Stop Recording" if recording
                        Text(audioRecorder.recording ? "Tap to Stop Recording" : "Tap to Record Audio")
                            .fontWeight(.bold)
                    }
                    VStack {
                    NavigationLink(destination: EffectsPicker(audioRecorder: audioRecorder)) {
                        Image(systemName: "arrow.right")
                        .resizable()
                            .renderingMode(.original)
                        .scaledToFit()
                            .frame(width: 50, height: 50)
                            .opacity(0.7)
                        }
                        Text("Next")
                        
                        
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(audioRecorder: AudioRecorder())
    }
}
