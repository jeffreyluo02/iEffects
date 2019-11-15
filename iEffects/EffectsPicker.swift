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
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [.gray, .white]), startPoint: .bottom, endPoint: .top).edgesIgnoringSafeArea(.all)
                VStack {
                    HStack(spacing: 20) {
                        VStack {
                            Button(action: {
                                // do pitch shift
                            }) {
                                Image(systemName: "wind")
                                    .renderingMode(.original)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 100, height: 100)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.black, lineWidth: 1))
                                    .shadow(color: .black, radius: 2)
                            }
                            Text("Pitch Shift")
                                .font(.caption)
                        }
                        VStack {
                            Button(action: {
                                // do reverb
                            }) {
                                Image(systemName: "snow")
                                    .renderingMode(.original)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 100, height: 100)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.black, lineWidth: 1))
                                    .shadow(color: .black, radius: 2)
                            }
                            Text("Reverb")
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
                                    .shadow(color: .black, radius: 2)
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
                                    .shadow(color: .black, radius: 2)
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
