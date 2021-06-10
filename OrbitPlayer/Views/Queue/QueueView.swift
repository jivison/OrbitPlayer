//
//  Queue.swift
//  OrbitPlayer
//
//  Created by John Ivison on 2021-05-01.
//

import SwiftUI

struct QueueView: View {
    var tracks: [Track]
    
    init() {
        self.tracks = TrackLoader().loadTracks(atPath: "/Users/john/Music/WJSN - Unnatural")
    }
    
    var body: some View {
        QueueTrackList(tracks: tracks)
    }
}

struct Queue_Previews: PreviewProvider {
    static var previews: some View {
        QueueView()
    }
}
