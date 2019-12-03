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
    @State private var showingPitchView = false
    @State private var showingReverbView = false
    @State private var showingDelayView = false
    @State private var showingSpeedView = false
    @State private var showingDistortionView = false
    @State private var showingRecordingsList = false
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [.gray, .white]), startPoint: .bottom, endPoint: .top).edgesIgnoringSafeArea(.all)
                VStack(spacing: 50) {
                    HStack(spacing: 50) {
                        VStack {
                            Button(action: {
                                self.showingRecordingsList.toggle()
                            }) {
                                Image(systemName: "headphones")
                                    .renderingMode(.original)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 100, height: 100)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                    //.overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.black, lineWidth: 2))
                                
                            }
                            .sheet(isPresented: $showingRecordingsList) {
                                RecordingsList()
                            }
                            Text("Recordings")
                        }
                        VStack {
                            Button(action: {
                                self.showingPitchView.toggle()
                            }) {
                                Image(systemName: "skew")
                                    .renderingMode(.original)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 100, height: 100)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                    //.overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.black, lineWidth: 2))
                            }
                            .sheet(isPresented: $showingPitchView) {
                                PitchView()
                            }
                            Text("Pitch")
                        }
                    }
                    HStack(spacing: 50) {
                        VStack {
                            Button(action: {
                                self.showingReverbView.toggle()
                            }) {
                                Image(systemName: "hifispeaker")
                                    .renderingMode(.original)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 100, height: 100)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                    //.overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.black, lineWidth: 2))
                                
                            }
                            .sheet(isPresented: $showingReverbView) {
                                ReverbView()
                            }
                            Text("Reverb")
                        }
                        VStack {
                            Button(action: {
                                self.showingDelayView.toggle()
                            }) {
                                Image(systemName: "dot.radiowaves.right")
                                    .renderingMode(.original)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 100, height: 100)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                    //.overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.black, lineWidth: 2))
                                
                            }
                            .sheet(isPresented: $showingDelayView) {
                                DelayView()
                            }
                            Text("Delay")
                        }
                    }
                    HStack(spacing: 50) {
                        VStack {
                            Button(action: {
                                self.showingSpeedView.toggle()
                            }) {
                                Image(systemName: "hare")
                                    .renderingMode(.original)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 100, height: 100)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                    //.overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.black, lineWidth: 2))
                                
                            }
                            .sheet(isPresented: $showingSpeedView) {
                                SpeedView()
                            }
                            Text("Speed Change")
                        }
                        VStack {
                            Button(action: {
                                self.showingDistortionView.toggle()
                            }) {
                                Image(systemName: "stopwatch")
                                    .renderingMode(.original)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 100, height: 100)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                    //.overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.black, lineWidth: 2))
                            }
                            .sheet(isPresented: $showingDistortionView) {
                                DistortionView()
                            }
                            Text("Distortion")
                        }
                    }
                }
            }
        }
        .navigationBarTitle("iEffects", displayMode: .inline)
    }
}

struct EffectsPicker_Previews: PreviewProvider {
    static var previews: some View {
        EffectsPicker(audioRecorder: AudioRecorder())
    }
}
