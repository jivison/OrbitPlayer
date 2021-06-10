//
//  TrackRow.swift
//  OrbitPlayer
//
//  Created by John Ivison on 2021-04-30.
//

import SwiftUI

struct QueueTrackRow: View {
    var track: Track
    
    var body: some View {
        HStack {
            track.metadata.getArtwork()
                .resizeKeepingAspectRatio(width: 35, height: 35)
                .cornerRadius(3)
            
            VStack(alignment: .leading) {
                Text(track.metadata.get(.title))
                    .font(.headline)
                HStack {
                    Text(track.metadata.get(.artist))
                        .font(.subheadline)
                    
                    Text(track.metadata.get(.album))
                        .font(.subheadline)
                        .italic()
                }
            }
            
            Spacer()
            
            Text(displayDuration(track.metadata.getDuration()))
        }.frame(maxWidth: 500)
    }
}

struct TrackRow_Previews: PreviewProvider {
    static var previews: some View {
        QueueTrackRow(track: Track(path: URL(fileURLWithPath: "/Users/john/Music/WJSN - Unnatural/우주소녀-4-New Me.mp3")))
    }
}
