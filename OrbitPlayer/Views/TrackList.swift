//
//  TrackList.swift
//  OrbitPlayer
//
//  Created by John Ivison on 2021-04-30.
//

import SwiftUI

struct TrackList: View {
    var tracks: [Track]
    
    var body: some View {
        List(tracks) { track in
            TrackRow(track: track).onTapGesture(count: 2) {
                track.play()
            }
        }
    }
}

struct TrackList_Previews: PreviewProvider {
    static var previews: some View {
        let tl = TrackLoader()
        let tracks = tl.loadTracks(atPath: "/Users/john/Dropbox/_Downloads/WJSN - Unnatural")
        
        TrackList(tracks: tracks)
    }
}
