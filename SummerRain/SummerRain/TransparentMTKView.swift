//
//  TransparentMTKView.swift
//  SummerRain
//
//  Created by Ian Martinez on 2/25/20.
//  Copyright © 2020 Ian Martinez. All rights reserved.
//

import Foundation
import MetalKit

class TransparentMTKView : MTKView {
    override var isOpaque: Bool {
        return false
    }
}
