//
//  ContentView.swift
//  OrbitPlayer
//
//  Created by John Ivison on 2021-04-30.
//

import SwiftUI
import AVFoundation

var avPlayer = AVPlayer()

struct ContentView: View {
    var tracks: [Track]
    
    init() {
        let tl = TrackLoader()
        self.tracks = tl.loadTracks(atPath: "/Users/john/Music/WJSN - Unnatural")
    }
    
    var body: some View {
        TrackList(tracks: tracks)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
