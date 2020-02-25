//
//  RainView.swift
//  SummerRain
//
//  Created by Ian Martinez on 2/25/20.
//  Copyright © 2020 Ian Martinez. All rights reserved.
//

import Metal
import MetalKit

class RainView : NSView, MTKViewDelegate {
    private var metalView : TransparentMTKView!
    private var metalDevice : MTLDevice!
    private var metalCommandQueue : MTLCommandQueue!
    
    public required init() {
        super.init(frame: .zero)
        setupView()
        setupMetal()
    }

    public required init?(coder aDecoder: NSCoder) {
        fatalError("Coder not supported")
    }
    
    fileprivate func setupView() {
        metalView = TransparentMTKView()
        addSubview(metalView)
        
        metalView.translatesAutoresizingMaskIntoConstraints = false
        metalView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        metalView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        metalView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        metalView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    fileprivate func setupMetal() {
        metalView.layer!.isOpaque = false
        metalView.delegate = self
        metalView.isPaused = true
        metalView.enableSetNeedsDisplay = true
        metalDevice = MTLCreateSystemDefaultDevice()!
        metalView.device = metalDevice
        metalCommandQueue = metalDevice.makeCommandQueue()!
        metalView.needsDisplay = true
    }
    
    override var isOpaque: Bool {
        return false;
    }
    
    func mtkView(_ view: MTKView, drawableSizeWillChange size: CGSize) {
           
    }

    func draw(in view: MTKView) {
        //Creating the commandBuffer for the queue
        guard let commandBuffer = metalCommandQueue.makeCommandBuffer() else { return }

        //Creating the interface for the pipeline
        guard let renderDescriptor = view.currentRenderPassDescriptor else { return }

        // r, g, b are pre-multiplied for some goddamn reason
        renderDescriptor.colorAttachments[0].clearColor = MTLClearColorMake(0.25, 0, 0, 0.25)

        guard let renderEncoder = commandBuffer.makeRenderCommandEncoder(descriptor: renderDescriptor) else { return }
        
        renderEncoder.endEncoding()
        commandBuffer.present(view.currentDrawable!)
        commandBuffer.commit()
    }
}
