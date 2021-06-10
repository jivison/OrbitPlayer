//
//  PlayerBar.swift
//  OrbitPlayer
//
//  Created by John Ivison on 2021-05-01.
//

import SwiftUI

struct PlayerBar: View {
    private var currentTrack: Track {
        return queue.currentTrack
    }
    
    var body: some View {
        HStack {
            Image(systemName: queue.playing ? "pause" : "play").onTapGesture(perform: queue.playPause)
            
            if queue.hasTrack {
                QueueTrackRow(track: currentTrack)
            }
        }.padding(9.0)
    }
}

struct PlayerBar_Previews: PreviewProvider {
    static var previews: some View {
        PlayerBar()
    }
}
