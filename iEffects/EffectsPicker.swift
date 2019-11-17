//
//  EffectsPicker.swift
//  iEffects
//
//  Created by Jeffrey Luo on 2019-11-14.
//  Copyright © 2019 Jeffrey Luo. All rights reserved.
//

import SwiftUI

struct EffectsPicker: View {
    
    @ObservedObject var audioRecorder : AudioRecorder
    @State private var showingPlaybackView = false
    @State private var showingPitchView = false
    @State private var showingReverbView = false
    @State private var showingDelayView = false
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [.gray, .white]), startPoint: .bottom, endPoint: .top).edgesIgnoringSafeArea(.all)
                VStack {
                    HStack(spacing: 20) {
                        VStack {
                            Button(action: {
                                self.showingPlaybackView.toggle()
                            }) {
                                Image(systemName: "wind")
                                    .renderingMode(.original)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 100, height: 100)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.black, lineWidth: 1))
    
                            }
                            .sheet(isPresented: $showingPlaybackView) {
                                PlaybackView()
                            }
                            Text("Playback")
                                .font(.caption)
                        }
                        VStack {
                            Button(action: {
                                self.showingPitchView.toggle()
                            }) {
                                Image(systemName: "snow")
                                    .renderingMode(.original)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 100, height: 100)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.black, lineWidth: 1))
                            }
                            .sheet(isPresented: $showingPitchView) {
                                PitchView()
                            }
                            Text("Pitch")
                                .font(.caption)
                        }
                    }
                    HStack(spacing: 20) {
                        VStack {
                            Button(action: {
                                self.showingReverbView.toggle()
                            }) {
                                Image(systemName: "flame")
                                    .renderingMode(.original)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 100, height: 100)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.black, lineWidth: 1))
                 
                            }
                            .sheet(isPresented: $showingReverbView) {
                                ReverbView()
                            }
                            Text("Reverb")
                                .font(.caption)
                        }
                        VStack {
                            Button(action: {
                                self.showingDelayView.toggle()
                            }) {
                                Image(systemName: "tropicalstorm")
                                    .renderingMode(.original)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 100, height: 100)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.black, lineWidth: 1))
   
                            }
                            .sheet(isPresented: $showingDelayView) {
                                DelayView()
                            }
                            Text("Delay")
                                .font(.caption)
                        }
                    }
                    HStack(spacing: 20) {
                        VStack {
                            Button(action: {
                                // do speed
                                }) {
                                Image(systemName: "flame")
                                    .renderingMode(.original)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 100, height: 100)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.black, lineWidth: 1))
        
                                }
                                Text("Speed Change")
                                    .font(.caption)
                            }
                        VStack {
                            Button(action: {
                                // do distortion
                            }) {
                                Image(systemName: "tropicalstorm")
                                    .renderingMode(.original)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 100, height: 100)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.black, lineWidth: 1))
                            }
                            Text("Distortion")
                                .font(.caption)
                        }
                    }
                }
            }
        }
        .navigationBarTitle("iEffects", displayMode: .inline)
        .navigationBarItems(trailing: NavigationLink(destination: RecordingsList(audioRecorder: self.audioRecorder)) {
                Text("Recordings")
        })
    }
}

struct EffectsPicker_Previews: PreviewProvider {
    static var previews: some View {
        EffectsPicker(audioRecorder: AudioRecorder())
    }
}
