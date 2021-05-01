//
//  LoadTracks.swift
//  OrbitPlayer
//
//  Created by John Ivison on 2021-04-30.
//

import Foundation

class TrackLoader {
    func loadTracks(atPath: String) -> [Track] {
        let url = URL(fileURLWithPath: atPath)
        let filenames = self.getFileNames(atPath: url)
        
        return filenames.map { fileURL -> Track in
            return Track(path: fileURL)
        }
    }
    
    private func getFileNames(atPath: URL) -> [URL] {
        let fm = FileManager.default
        
        var items: [URL] = []
        let dirEnum = fm.enumerator(atPath: atPath.path)
        
        while let file = dirEnum?.nextObject() as? String {
            if file.hasSuffix("mp3") || file.hasSuffix("flac") {
                items.append(atPath.appendingPathComponent("/\(file)"))
            }
        }

        return items
    }
}


let tl = TrackLoader()
let tracks = tl.loadTracks(atPath: "/Users/john/Dropbox/_Downloads/WJSN - Unnatural")
