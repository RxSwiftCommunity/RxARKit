//
//  ARSKView+Rx.swift
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

extension Reactive where Base: ARSKView {
    
    // MARK: - ARSKViewDelegate
    
    public var nodeForAnchor: SKNodeForAnchor {
        get {
            return proxy?.nodeForAnchor ?? RxARSKViewDelegateProxy.defaultNodeForAnchor
        }
        set {
            proxy?.nodeForAnchor = newValue
        }
    }
    
    public var didAddNodeForAnchor: ControlEvent<EventSKNodeForAnchor> {
        let source: Observable<EventSKNodeForAnchor> = delegate
            .methodInvoked(.didAddSKNodeForAnchor)
            .map(toEventSKNodeForAnchor)
        return ControlEvent(events: source)
    }

    public var willUpdateNodeForAnchor: ControlEvent<EventSKNodeForAnchor> {
        let source: Observable<EventSKNodeForAnchor> = delegate
            .methodInvoked(.willUpdateSKNodeForAnchor)
            .map(toEventSKNodeForAnchor)
        return ControlEvent(events: source)
    }

    public var didUpdateNodeForAnchor: ControlEvent<EventSKNodeForAnchor> {
        let source: Observable<EventSKNodeForAnchor> = delegate
            .methodInvoked(.didUpdateSKNodeForAnchor)
            .map(toEventSKNodeForAnchor)
        return ControlEvent(events: source)
    }

    public var didRemoveNodeForAnchor: ControlEvent<EventSKNodeForAnchor> {
        let source: Observable<EventSKNodeForAnchor> = delegate
            .methodInvoked(.didRemoveSKNodeForAnchor)
            .map(toEventSKNodeForAnchor)
        return ControlEvent(events: source)
    }

    // MARK: - SKViewDelegate
    
    public var shouldRenderAtTime: ShouldRenderAtTime {
        get {
            return proxy?.shouldRenderAtTime ?? RxARSKViewDelegateProxy.defaultShouldRenderAtTime
        }
        set {
            proxy?.shouldRenderAtTime = newValue
        }
    }
    
    // MARK: - private
    
    var proxy: RxARSKViewDelegateProxy? {
        return self.delegate as? RxARSKViewDelegateProxy
    }
    
    // MARK: -
    
    /// Reactive wrapper for `delegate`.
    /// For more information take a look at `DelegateProxyType` protocol documentation.
    public var delegate: DelegateProxy<ARSKView, ARSKViewDelegate> {
        return RxARSKViewDelegateProxy.proxy(for: base)
    }
    
    /// Installs delegate as forwarding delegate on `delegate`.
    /// Delegate won't be retained.
    ///
    /// It enables using normal delegKate mechanism with reactive delegate mechanism.
    ///
    /// - parameter delegate: Delegate object.
    /// - returns: Disposable object that can be used to unbind the delegate.
    public func setDelegate(_ delegate: ARSKViewDelegate)
        -> Disposable {
            return RxARSKViewDelegateProxy.installForwardDelegate(delegate, retainDelegate: false, onProxyForObject: self.base)
    }

}
