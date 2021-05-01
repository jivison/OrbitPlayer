//
//  Displays.swift
//  OrbitPlayer
//
//  Created by John Ivison on 2021-04-30.
//

import Foundation

func displayDuration(_ duration: Float) -> String {
    let minutes = Int((duration / 60).rounded(.down))
    let seconds = Int(duration.truncatingRemainder(dividingBy: 60))
    
    let secondsDisplay = seconds == 0 ? "00" : seconds < 10 ? "0\(seconds)" : "\(seconds)"
    
    return "\(minutes):\(secondsDisplay)"
}
