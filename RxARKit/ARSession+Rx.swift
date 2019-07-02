//
//  ARSession+Rx.swift
//  RxARKit
//
//  Created by Maxim Volgin on 22/06/2018.
//  Copyright (c) RxSwiftCommunity. All rights reserved.
//

import ARKit
#if !RX_NO_MODULE
import RxSwift
import RxCocoa
#endif

extension Reactive where Base: ARSession {
    
    // MARK: - ARSessionObserver
    
    public var didFailWithError: ControlEvent<EventError> {
        let source: Observable<EventError> = delegate
            .methodInvoked(.didFailWithError)
            .map(toEventError)
        return ControlEvent(events: source)
    }

    public var cameraDidChangeTrackingState: ControlEvent<EventARCamera> {
        let source: Observable<EventARCamera> = delegate
            .methodInvoked(.cameraDidChangeTrackingState)
            .map(toEventARCamera)
        return ControlEvent(events: source)
    }
    
    public var sessionWasInterrupted: ControlEvent<ARSession> {
        let source: Observable<ARSession> = delegate
            .methodInvoked(.sessionWasInterrupted)
            .map(toARSession)
        return ControlEvent(events: source)
    }

    public var sessionInterruptionEnded: ControlEvent<ARSession> {
        let source: Observable<ARSession> = delegate
            .methodInvoked(.sessionInterruptionEnded)
            .map(toARSession)
        return ControlEvent(events: source)
    }

    public var sessionShouldAttemptRelocalization: ControlEvent<ARSession> {
        let source: Observable<ARSession> = delegate
            .methodInvoked(.sessionShouldAttemptRelocalization)
            .map(toARSession)
        return ControlEvent(events: source)
    }
    
    public var didOutputAudioSampleBuffer: ControlEvent<EventCMSampleBuffer> {
        let source: Observable<EventCMSampleBuffer> = delegate
            .methodInvoked(.didOutputAudioSampleBuffer)
            .map(toEventCMSampleBuffer)
        return ControlEvent(events: source)
    }
    
    // MARK: - ARSessionDelegate
    
    public var didUpdateFrame: ControlEvent<EventARFrame> {
        let source: Observable<EventARFrame> = delegate
            .methodInvoked(.didUpdateFrame)
            .map(toEventARFrame)
        return ControlEvent(events: source)
    }
    
    public var didAddAnchors: ControlEvent<EventARAnchors> {
        let source: Observable<EventARAnchors> = delegate
            .methodInvoked(.didAddAnchors)
            .map(toEventARAnchors)
        return ControlEvent(events: source)
    }

    public var didUpdateAnchors: ControlEvent<EventARAnchors> {
        let source: Observable<EventARAnchors> = delegate
            .methodInvoked(.didUpdateAnchors)
            .map(toEventARAnchors)
        return ControlEvent(events: source)
    }

    public var didRemoveAnchors: ControlEvent<EventARAnchors> {
        let source: Observable<EventARAnchors> = delegate
            .methodInvoked(.didRemoveAnchors)
            .map(toEventARAnchors)
        return ControlEvent(events: source)
    }

    // MARK: -

    /// Reactive wrapper for `ARSessionDelegate`.
    public var delegate: RxARSessionDelegate {
        return RxARSessionDelegateProxy.proxy(for: base)
    }
    
}
