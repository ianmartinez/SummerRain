//
//  SummerRainView.swift
//  SummerRain
//
//  Created by Ian Martinez on 2/25/20.
//  Copyright © 2020 Ian Martinez. All rights reserved.
//

import ScreenSaver

class SummerRainView: ScreenSaverView {
    
    override init?(frame: NSRect, isPreview: Bool) {
        super.init(frame: frame, isPreview: isPreview)
        
        // Make sure we are on a device that can run metal!
        guard let defaultDevice = MTLCreateSystemDefaultDevice() else {
            fatalError("Device loading error")
        }
        
        wantsLayer = true
        
        let rainView = RainView(frame: frame, device: defaultDevice)
        subviews.append(rainView)
    }

    required init?(coder aDecoder: NSCoder) {
      super.init(coder: aDecoder)
    }
    
    override func startAnimation() {
        // Get the current background
        let screenshot = getBackground()
        layer!.contents = screenshot!
        
        super.startAnimation()
    }
    
    override func stopAnimation() {
        super.stopAnimation()
    }
    
    override func draw(_ rect: NSRect) {
        
    }

    override func animateOneFrame() {
        super.animateOneFrame()
    }

    override var hasConfigureSheet : Bool {
        get {
            return true;
        }
    }
    
    override var configureSheet : NSWindow {
        get {
            return NSWindow()
        }
    }
    
}
