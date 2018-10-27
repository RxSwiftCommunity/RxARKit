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


