//
//  Selector.swift
//  RxARKit
//
//  Created by Maxim Volgin on 27/10/2018.
//  Copyright (c) RxSwiftCommunity. All rights reserved.
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

// MARK: - ARSKViewDelegate

extension Selector {
    static let didAddSKNodeForAnchor = #selector(ARSKViewDelegate.view(_:didAdd:for:))
    static let willUpdateSKNodeForAnchor = #selector(ARSKViewDelegate.view(_:willUpdate:for:))
    static let didUpdateSKNodeForAnchor = #selector(ARSKViewDelegate.view(_:didUpdate:for:))
    static let didRemoveSKNodeForAnchor = #selector(ARSKViewDelegate.view(_:didRemove:for:))
}

// MARK: - SKViewDelegate

// MARK: - ARSCNViewDelegate

extension Selector {
    static let didAddSCNNodeForAnchor = #selector(ARSCNViewDelegate.renderer(_:didAdd:for:))
    static let willUpdateSCNNodeForAnchor = #selector(ARSCNViewDelegate.renderer(_:willUpdate:for:))
    static let didUpdateSCNNodeForAnchor = #selector(ARSCNViewDelegate.renderer(_:didUpdate:for:))
    static let didRemoveSCNNodeForAnchor = #selector(ARSCNViewDelegate.renderer(_:didRemove:for:))
}

// MARK: - SCNSceneRendererDelegate

extension Selector {
    static let updateAtTime = #selector(ARSCNViewDelegate.renderer(_:updateAtTime:))
    static let didApplyAnimationsAtTime = #selector(ARSCNViewDelegate.renderer(_:didApplyAnimationsAtTime:))
    static let didSimulatePhysicsAtTime = #selector(ARSCNViewDelegate.renderer(_:didSimulatePhysicsAtTime:))
    static let didApplyConstraintsAtTime = #selector(ARSCNViewDelegate.renderer(_:didApplyConstraintsAtTime:))
    static let willRenderSceneAtTime = #selector(ARSCNViewDelegate.renderer(_:willRenderScene:atTime:))
    static let didRenderSceneAtTime = #selector(ARSCNViewDelegate.renderer(_:didRenderScene:atTime:))
}
