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
                Button("Play Recording") {
                    // do something
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
