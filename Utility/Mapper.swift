//
//  Mapper.swift
//  RxARKit
//
//  Created by Maxim Volgin on 27/10/2018.
//  Copyright © 2018 Maxim Volgin. All rights reserved.
//

import ARKit
#if !RX_NO_MODULE
import RxSwift
import RxCocoa
#endif

// MARK: - ARSessionObserver

func toEventError(_ args: [Any]) throws -> EventError {
    let session = try castOrThrow(ARSession.self, args[0])
    let error = try castOrThrow(Error.self, args[1])
    return (session, error)
}

func toEventARCamera(_ args: [Any]) throws -> EventARCamera {
    let session = try castOrThrow(ARSession.self, args[0])
    let camera = try castOrThrow(ARCamera.self, args[1])
    return (session, camera)
}

func toARSession(_ args: [Any]) throws -> ARSession {
    let session = try castOrThrow(ARSession.self, args[0])
    return session
}

func toEventCMSampleBuffer(_ args: [Any]) throws -> EventCMSampleBuffer {
    let session = try castOrThrow(ARSession.self, args[0])
    let audioSampleBuffer = try castOrThrow(CMSampleBuffer.self, args[1])
    return (session, audioSampleBuffer)
}

// MARK: - ARSessionDelegate

func toEventARFrame(_ args: [Any]) throws -> EventARFrame {
    let session = try castOrThrow(ARSession.self, args[0])
    let frame = try castOrThrow(ARFrame.self, args[1])
    return (session, frame)
}

func toEventARAnchors(_ args: [Any]) throws -> EventARAnchors {
    let session = try castOrThrow(ARSession.self, args[0])
    let anchors = try castOrThrow(Array<ARAnchor>.self, args[1])
    return (session, anchors)
}

// MARK: - ARSKViewDelegate

func toEventSKNodeForAnchor(_ args: [Any]) throws -> EventSKNodeForAnchor {
    let view = try castOrThrow(ARSKView.self, args[0])
    let node = try castOrThrow(SKNode.self, args[1])
    let anchor = try castOrThrow(ARAnchor.self, args[2])
    return (view, node, anchor)
}

// MARK: - ARSCNViewDelegate

func toEventSCNNodeForAnchor(_ args: [Any]) throws -> EventSCNNodeForAnchor {
    let sceneRenderer = try castOrThrow(SCNSceneRenderer.self, args[0])
    let node = try castOrThrow(SCNNode.self, args[1])
    let anchor = try castOrThrow(ARAnchor.self, args[2])
    return (sceneRenderer, node, anchor)
}

// MARK: - SCNSceneRendererDelegate

func toEventTime(_ args: [Any]) throws -> EventTime {
    let renderer = try castOrThrow(SCNSceneRenderer.self, args[0])
    let time = try castOrThrow(TimeInterval.self, args[1])
    return (renderer, time)
}

func toEventRender(_ args: [Any]) throws -> EventRender {
    let renderer = try castOrThrow(SCNSceneRenderer.self, args[0])
    let scene = try castOrThrow(SCNScene.self, args[1])
    let time = try castOrThrow(TimeInterval.self, args[2])
    return (renderer, scene, time)
}
