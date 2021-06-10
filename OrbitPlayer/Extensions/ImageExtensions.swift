//
//  ImageExtensions.swift
//  OrbitPlayer
//
//  Created by John Ivison on 2021-05-01.
//

import Foundation
import SwiftUI

extension Image {
    func resizeKeepingAspectRatio(width: CGFloat, height: CGFloat) -> some View {
        return self.resizable()
            .scaledToFit()
            .frame(width: width, height: height)
    }
}
