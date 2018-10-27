//
//  ARSCNView+Rx.swift
//  RxARKit
//
//  Created by Maxim Volgin on 22/06/2018.
//  Copyright © 2018 Maxim Volgin. All rights reserved.
//

import ARKit
#if !RX_NO_MODULE
import RxSwift
import RxCocoa
#endif

extension Reactive where Base: ARSCNView {
    
    // MARK:- ARSCNViewDelegate
    
    public var nodeForAnchor: SCNNodeForAnchor {
        get {
            return proxy?.nodeForAnchor ?? RxARSCNViewDelegateProxy.defaultNodeForAnchor
        }
        set {
            proxy?.nodeForAnchor = newValue
        }
    }
    
    public var didAddNodeForAnchor: ControlEvent<EventSCNNodeForAnchor> {
        let source: Observable<EventSCNNodeForAnchor> = delegate
            .methodInvoked(.didAddSCNNodeForAnchor)
            .map(toEventSCNNodeForAnchor)
        return ControlEvent(events: source)
    }
    
    public var willUpdateNodeForAnchor: ControlEvent<EventSCNNodeForAnchor> {
        let source: Observable<EventSCNNodeForAnchor> = delegate
            .methodInvoked(.willUpdateSCNNodeForAnchor)
            .map(toEventSCNNodeForAnchor)
        return ControlEvent(events: source)
    }
    
    public var didUpdateNodeForAnchor: ControlEvent<EventSCNNodeForAnchor> {
        let source: Observable<EventSCNNodeForAnchor> = delegate
            .methodInvoked(.didUpdateSCNNodeForAnchor)
            .map(toEventSCNNodeForAnchor)
        return ControlEvent(events: source)
    }
    
    public var didRemoveNodeForAnchor: ControlEvent<EventSCNNodeForAnchor> {
        let source: Observable<EventSCNNodeForAnchor> = delegate
            .methodInvoked(.didRemoveSCNNodeForAnchor)
            .map(toEventSCNNodeForAnchor)
        return ControlEvent(events: source)
    }
    
    // MARK: - SCNSceneRendererDelegate
    
    public var updateAtTime: ControlEvent<EventTime> {
        let source: Observable<EventTime> = delegate
            .methodInvoked(.updateAtTime)
            .map(toEventTime)
        return ControlEvent(events: source)
    }

    public var didApplyAnimationsAtTime: ControlEvent<EventTime> {
        let source: Observable<EventTime> = delegate
            .methodInvoked(.didApplyAnimationsAtTime)
            .map(toEventTime)
        return ControlEvent(events: source)
    }
    
    public var didSimulatePhysicsAtTime: ControlEvent<EventTime> {
        let source: Observable<EventTime> = delegate
            .methodInvoked(.didSimulatePhysicsAtTime)
            .map(toEventTime)
        return ControlEvent(events: source)
    }

    public var didApplyConstraintsAtTime: ControlEvent<EventTime> {
        let source: Observable<EventTime> = delegate
            .methodInvoked(.didApplyConstraintsAtTime)
            .map(toEventTime)
        return ControlEvent(events: source)
    }

    public var willRenderSceneAtTime: ControlEvent<EventRender> {
        let source: Observable<EventRender> = delegate
            .methodInvoked(.willRenderSceneAtTime)
            .map(toEventRender)
        return ControlEvent(events: source)
    }

    public var didRenderSceneAtTime: ControlEvent<EventRender> {
        let source: Observable<EventRender> = delegate
            .methodInvoked(.didRenderSceneAtTime)
            .map(toEventRender)
        return ControlEvent(events: source)
    }

    // MARK: - private
    
    var proxy: RxARSCNViewDelegateProxy? {
        return self.delegate as? RxARSCNViewDelegateProxy
    }
    
    // MARK: -
    
    /// Reactive wrapper for `delegate`.
    /// For more information take a look at `DelegateProxyType` protocol documentation.
    public var delegate: DelegateProxy<ARSCNView, ARSCNViewDelegate> {
        return RxARSCNViewDelegateProxy.proxy(for: base)
    }
    
    /// Installs delegate as forwarding delegate on `delegate`.
    /// Delegate won't be retained.
    ///
    /// It enables using normal delegate mechanism with reactive delegate mechanism.
    ///
    /// - parameter delegate: Delegate object.
    /// - returns: Disposable object that can be used to unbind the delegate.
    public func setDelegate(_ delegate: ARSCNViewDelegate)
        -> Disposable {
            return RxARSCNViewDelegateProxy.installForwardDelegate(delegate, retainDelegate: false, onProxyForObject: self.base)
    }
    
}

