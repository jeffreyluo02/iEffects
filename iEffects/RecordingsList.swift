//
//  RecordingsList.swift
//  iEffects
//
//  Created by Jeffrey Luo on 2019-11-12.
//  Copyright © 2019 Jeffrey Luo. All rights reserved.
//

import SwiftUI

struct RecordingsList: View {
    
    @ObservedObject var audioRecorder: AudioRecorder
    
    var body: some View {
        NavigationView {
            List {
                ForEach(audioRecorder.recordings, id: \.createdAt) { recording in
                    RecordingRow(audioURL: recording.fileURL)
                }
                .onDelete(perform: delete)
            }
        .navigationBarTitle("Recordings")
        .navigationBarItems(trailing: EditButton())
        }
    }
    
    func delete(at offsets: IndexSet) {
        var urlsToDelete = [URL]()
        for index in offsets {
            urlsToDelete.append(audioRecorder.recordings[index].fileURL)
        }
        audioRecorder.deleteRecording(urlsToDelete: urlsToDelete)
    }
}

struct RecordingRow: View {
    var audioURL : URL
    
    @ObservedObject var audioPlayer = AudioPlayer()
    
    var body: some View {
        HStack {
            Text("\(audioURL.lastPathComponent)")
            Spacer()
            if audioPlayer.isPlaying == false {
            Button(action: {
                self.audioPlayer.startPlayback(audio: self.audioURL)
            })  {
                Image(systemName: "play.circle")
                }
            } else {
                Button(action: {
                    self.audioPlayer.stopPlayback()
                })  {
                    Image(systemName: "stop")
                }
            }
        }
    }
}

struct RecordingsList_Previews: PreviewProvider {
    static var previews: some View {
        RecordingsList(audioRecorder: AudioRecorder())
    }
}
