//
//  Track.swift
//  OrbitPlayer
//
//  Created by John Ivison on 2021-04-30.
//

import Foundation
import AVFoundation
import AudioToolbox
import SwiftUI

enum MetadataItem: String {
    case title
    case artist
    case album
    case rawDuration = "approximate duration in seconds"
}

class Track: Identifiable {
    var id: String
    var playerItem: AVPlayerItem
    var metadata: Metadata
    var url: URL
    var format: String
    
    init(path: URL) {
        self.playerItem = AVPlayerItem(url: path)
        self.metadata = Metadata(url: path, playerItem: self.playerItem)
        self.id = path.path
        self.url = path
        self.format = self.url.pathExtension == "mp3" ? "mp3" : "flac"
    }
    
    public func play() {
        queue.play(self)
    }
    
    static func == (lhs: Track, rhs: Track) -> Bool {
        return lhs.id == rhs.id
    }
}

class Metadata {
    private var rawMetadata: NSDictionary
    private var playerItem: AVPlayerItem
    
    init(url: URL, playerItem: AVPlayerItem) {
        self.rawMetadata = audioFileInfo(url: url)!
        self.playerItem = playerItem
    }
    
    public func get(_ key: MetadataItem) -> String {
        return self.getMetadataItem(key.rawValue, fallback: "")!
    }
    
    func getDuration() -> Float {
        return Float(self.get(.rawDuration)) ?? 0
    }
    
    func getArtwork() -> Image {
        let artwork = self.getAVPMetadataItem("artwork") as! Data?
        
        if artwork == nil { return Image("unknown album") }
        
        return Image(nsImage: NSImage.init(data: artwork!)!)
    }
    
    private func getMetadataItem(_ fromKey: String, fallback: String?) -> String? {
        return self.rawMetadata[fromKey] as? String ?? fallback
    }
    
    private func getAVPMetadataItem(_ fromKey: String) -> Any? {
        let metadataList = playerItem.asset.metadata
        
        for item in metadataList {
            guard let key = item.commonKey?.rawValue, let value = item.value else{
                continue
            }
            
            if key == fromKey {
                return value
            }
        }
        
        return nil
    }
}

func audioFileInfo(url: URL) -> NSDictionary? {
    var fileID: AudioFileID? = nil
    var status:OSStatus = AudioFileOpenURL(url as CFURL, .readPermission, kAudioFileFLACType, &fileID)

    guard status == noErr else { return nil }

    var dict: CFDictionary? = nil
    var dataSize = UInt32(MemoryLayout<CFDictionary?>.size(ofValue: dict))

    guard let audioFile = fileID else { return nil }

    status = AudioFileGetProperty(audioFile, kAudioFilePropertyInfoDictionary, &dataSize, &dict)

    guard status == noErr else { return nil }

    AudioFileClose(audioFile)

    guard let cfDict = dict else { return nil }

    let tagsDict = NSDictionary.init(dictionary: cfDict)

    return tagsDict
}
