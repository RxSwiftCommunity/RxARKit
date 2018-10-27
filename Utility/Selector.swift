//
//  Selector.swift
//  RxARKit
//
//  Created by Maxim Volgin on 27/10/2018.
//  Copyright © 2018 Maxim Volgin. All rights reserved.
//

import ARKit

// MARK: - ARSessionObserver

extension Selector {
    static let didFailWithError = #selector(ARSessionObserver.session(_:didFailWithError:))
    static let cameraDidChangeTrackingState = #selector(ARSessionObserver.session(_:cameraDidChangeTrackingState:))
    static let sessionWasInterrupted = #selector(ARSessionObserver.sessionWasInterrupted(_:))
    static let sessionInterruptionEnded = #selector(ARSessionObserver.sessionInterruptionEnded(_:))
    static let sessionShouldAttemptRelocalization = #selector(ARSessionObserver.sessionShouldAttemptRelocalization(_:))
    static let didOutputAudioSampleBuffer = #selector(ARSessionObserver.session(_:didOutputAudioSampleBuffer:))
}

// MARK: - ARSessionDelegate

extension Selector {
    static let didUpdateFrame = #selector(ARSessionDelegate.session(_:didUpdate:) as ((ARSessionDelegate) -> (ARSession, ARFrame) -> Void)?)
    static let didAddAnchors = #selector(ARSessionDelegate.session(_: didAdd:))
    static let didUpdateAnchors = #selector(ARSessionDelegate.session(_: didUpdate:) as ((ARSessionDelegate) -> (ARSession, [ARAnchor]) -> Void)?)
    static let didRemoveAnchors = #selector(ARSessionDelegate.session(_: didRemove:))
}
