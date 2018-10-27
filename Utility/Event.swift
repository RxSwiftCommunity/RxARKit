//
//  Event.swift
//  RxARKit
//
//  Created by Maxim Volgin on 27/10/2018.
//  Copyright © 2018 Maxim Volgin. All rights reserved.
//

import ARKit

// MARK: - ARSessionObserver

public typealias EventError = (session: ARSession, error: Error)
public typealias EventARCamera = (session: ARSession, camera: ARCamera)
public typealias EventCMSampleBuffer = (session: ARSession, audioSampleBuffer: CMSampleBuffer)

// MARK: - ARSessionDelegate

public typealias EventARFrame = (session: ARSession, frame: ARFrame)
public typealias EventARAnchors = (session: ARSession, anchors: [ARAnchor])
