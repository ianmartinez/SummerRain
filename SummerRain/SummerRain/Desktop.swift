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

public func getDesktopScreenshot() -> NSImage {
    let displayID = CGMainDisplayID()
    let cgScreenshot = CGDisplayCreateImage(displayID)!
    let cgScreenshotCrop =
        cropImage(inputImage: cgScreenshot, toRect: NSRect(x: 0, y: 50, width: cgScreenshot.width, height: cgScreenshot.height))
    let screenshot = NSImage(cgImage: cgScreenshotCrop ?? cgScreenshot, size: NSZeroSize)
    
    return screenshot
}


func cropImage(inputImage: CGImage, toRect: CGRect) -> CGImage?
{
    guard let crop = inputImage.cropping(to: toRect) else { return nil }
    return crop
}
