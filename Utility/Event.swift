//
//  Event.swift
//  RxARKit
//
//  Created by Maxim Volgin on 27/10/2018.
//  Copyright (c) RxSwiftCommunity. All rights reserved.
//

import ARKit

// MARK: - ARSessionObserver

public typealias EventError = (session: ARSession, error: Error)
public typealias EventARCamera = (session: ARSession, camera: ARCamera)
public typealias EventCMSampleBuffer = (session: ARSession, audioSampleBuffer: CMSampleBuffer)

// MARK: - ARSessionDelegate

public typealias EventARFrame = (session: ARSession, frame: ARFrame)
public typealias EventARAnchors = (session: ARSession, anchors: [ARAnchor])

// MARK: - ARSKViewDelegate

public typealias EventSKNodeForAnchor = (view: ARSKView, node: SKNode, anchor: ARAnchor)

// MARK: - ARSCNViewDelegate

public typealias EventSCNNodeForAnchor = (renderer: SCNSceneRenderer, node: SCNNode, anchor: ARAnchor)

// MARK: - SCNSceneRendererDelegate

public typealias EventTime = (renderer: SCNSceneRenderer, time: TimeInterval)
public typealias EventRender = (renderer: SCNSceneRenderer, scene: SCNScene, time: TimeInterval)
