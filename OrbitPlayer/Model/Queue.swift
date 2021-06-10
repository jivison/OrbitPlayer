//
//  Queue.swift
//  OrbitPlayer
//
//  Created by John Ivison on 2021-05-01.
//

import Foundation
import AVFoundation

class Queue {
    private let player = AVPlayer()
    private var queue: [Track] = []
    private var queueIndex: Int = 0
    private var isPlaying = false
    
    var playing: Bool {
        return self.isPlaying
    }
    
    var hasTrack: Bool {
        return self.queue.count > 0
    }
    
    var currentTrack: Track {
        return self.queue[self.queueIndex]
    }
    
    func play(_ track: Track, queueing: [Track] = []) {
        self.clearQueue()
        self.queue([track])
        self.queue(queueing)
        
        self.startPlayback()
    }
    
    func playNext(_ tracks: [Track]) {
        for track in tracks.reversed() {
            self.queue.insert(track, at: self.queueIndex)
        }
    }
    
    func playPause() {
        if self.isPlaying {
            self.pausePlayback()
        } else {
            self.startPlayback()
        }
    }
    
    func next() {
        self.queueIndex += 1
        self.startPlayback()
    }
    
    func previous() {
        self.queueIndex -= 1
        self.startPlayback()
    }
    
    func queue(_ tracks: [Track]) {
        for track in tracks {
            self.queue.append(track)
        }
    }
    
    func clearQueue(keepCurrentTrack: Bool = false) {
        let newQueue = keepCurrentTrack ? Array(self.queue[0...1]) : []
        
        self.queue = newQueue
    }
    
    private func startPlayback() {
        self.isPlaying = true
        self.player.replaceCurrentItem(with: self.currentTrack.playerItem)
        self.player.play()
    }
    
    private func pausePlayback() {
        self.isPlaying = false
        self.player.pause()
    }
}

let queue = Queue()


