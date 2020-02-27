//
//  RainView.swift
//  SummerRain
//
//  Created by Ian Martinez on 2/25/20.
//  Copyright © 2020 Ian Martinez. All rights reserved.
//

import SceneKit

class RainView : NSView {
    private var sceneView : SCNView!
    
    public required init() {
        super.init(frame: .zero)
        setupView()
        setupScene()
    }

    public required init?(coder aDecoder: NSCoder) {
        fatalError("Coder not supported")
    }
    
    fileprivate func setupView() {
        sceneView = SCNView()
        addSubview(sceneView)
        
        sceneView.translatesAutoresizingMaskIntoConstraints = false
        sceneView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        sceneView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        sceneView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        sceneView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    fileprivate func setupScene() {
        // Create scene
        let scene = SCNScene()
        sceneView.scene = scene
        
        // Set the background to match the user's desktop picture
        scene.background.contents = getDesktopPicture()!
        
        // Set up camera
        let camera = SCNCamera()
        let cameraNode = SCNNode()
        cameraNode.camera = camera
        cameraNode.position = SCNVector3(x: 0.0, y: 0.0, z: 3.0)
        
        // Set up lighting
        let light = SCNLight()
        light.type = SCNLight.LightType.omni
        let lightNode = SCNNode()
        lightNode.light = light
        lightNode.position = SCNVector3(x: 1.5, y: 1.5, z: 1.5)

        let cubeGeometry = SCNBox(width: 1.0, height: 1.0, length: 1.0, chamferRadius: 0.0)
        let cubeNode = SCNNode(geometry: cubeGeometry)
        cubeNode.castsShadow = true

        // Add nodes
        scene.rootNode.addChildNode(lightNode)
        scene.rootNode.addChildNode(cameraNode)
        scene.rootNode.addChildNode(cubeNode)
    }
}
