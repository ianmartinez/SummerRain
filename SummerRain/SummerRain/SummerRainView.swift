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

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func startAnimation() {
        super.startAnimation()
        
        // Create a SceneKit view to render
        let rainView = RainView()
        addSubview(rainView)
        rainView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        rainView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        rainView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        rainView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
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
