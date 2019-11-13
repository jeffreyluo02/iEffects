//
//  AudioRecorder.swift
//  iEffects
//
//  Created by Jeffrey Luo on 2019-11-12.
//  Copyright © 2019 Jeffrey Luo. All rights reserved.
//

import Foundation
import SwiftUI
import Combine
import AVFoundation

class AudioRecorder: NSObject, ObservableObject {
    
    // fetch recordings on app start
    override init() {
        super.init()
        fetchRecordings()
    }
    
    var audioRecorder : AVAudioRecorder!
    
    // array of our recordings
    var recordings = [Recording]()
    
    let objectWillChange = PassthroughSubject<AudioRecorder, Never>()

    // boolean for whether we are recording or not
    var recording = false {
        // update observing views
        didSet {
            objectWillChange.send(self)
        }
    }
    
    // function for recording audio
    func startRecording() {
        let recordingSession = AVAudioSession.sharedInstance()
        // define type for our recording session and activate it, if this fails, output error
        do {
            try recordingSession.setCategory(.playAndRecord, mode: .default)
            try recordingSession.setActive(true)
        } catch {
            print("Failed to set up recording session")
        }
        // specify location where recording should be saved
        let documentPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        // name the file after the date and time of the recording and give it .m4a format
        let audioFileName = documentPath.appendingPathComponent("\(Date().toString(dateFormat: "dd-MM-YY_'at'_HH:mm:ss")).m4a")
        // settings for our recording
        let settings = [
            AVFormatIDKey: Int(kAudioFormatMPEG4AAC),
            AVSampleRateKey: 12000,
            AVNumberOfChannelsKey: 1,
            AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue
        ]
        
        do {
            audioRecorder = try AVAudioRecorder(url: audioFileName, settings: settings)
            audioRecorder.record()
            
            recording = true
        } catch {
            print("Could not start recording")
        }
    }
    
    func stopRecording() {
        audioRecorder.stop()
        recording = false
        
        fetchRecordings()
    }
    
    // access our stored recordings
    func fetchRecordings() {
        // refresh the array by removing everything
        recordings.removeAll()
        
        let fileManager = FileManager.default
        let documentDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let directoryContents = try! fileManager.contentsOfDirectory(at: documentDirectory, includingPropertiesForKeys: nil)
        
        // cycle through audio files
        for audio in directoryContents {
            let recording = Recording(fileURL: audio, createdAt: getCreationDate(for: audio))
            recordings.append(recording)
        }
        // sort the recordings by date
        recordings.sort(by: { $0.createdAt.compare($1.createdAt) == .orderedAscending})
        
        // update all observing views
        objectWillChange.send(self)
    }
    
    // delete recordings from the document folder
    func deleteRecording(urlsToDelete: [URL]) {
        for url in urlsToDelete {
            print(url)
            do {
               try FileManager.default.removeItem(at: url)
            } catch {
                print("File could not be deleted!")
            }
        }
        
        fetchRecordings()
        
    }
}
