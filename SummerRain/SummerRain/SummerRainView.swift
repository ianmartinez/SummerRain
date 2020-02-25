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
    }

    @available(*, unavailable)
    required init?(coder decoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func startAnimation() {
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
