//
//  Screenshot.swift
//  SummerRain
//
//  Created by Ian Martinez on 2/25/20.
//  Copyright © 2020 Ian Martinez. All rights reserved.
//

import Foundation
import AppKit

// Get the user's desktop picture
public func getDesktopPicture() -> NSImage? {
    let workspace = NSWorkspace.shared
    let screen = NSScreen.main!
    guard let background = workspace.desktopImageURL(for: screen) else {
        return nil
    }
    
    return NSImage(contentsOf: background)
}

public func getScreenshot() -> NSImage {
    let displayID = CGMainDisplayID()
    return NSImage(cgImage: CGDisplayCreateImage(displayID)!, size: NSZeroSize)
}
