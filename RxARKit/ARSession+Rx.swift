//
//  ARSession+Rx.swift
//  RxARKit
//
//  Created by Maxim Volgin on 22/06/2018.
//  Copyright © 2018 Maxim Volgin. All rights reserved.
//

import ARKit
import RxSwift
import RxCocoa

extension Reactive where Base: ARSession {
    /// Reactive wrapper for `delegate`.
    /// For more information take a look at `DelegateProxyType` protocol documentation.
    public var delegate: DelegateProxy<ARSession, ARSessionDelegate> {
        return RxARSessionDelegateProxy.proxy(for: base)
    }
    
    /// Installs delegate as forwarding delegate on `delegate`.
    /// Delegate won't be retained.
    ///
    /// It enables using normal delegate mechanism with reactive delegate mechanism.
    ///
    /// - parameter delegate: Delegate object.
    /// - returns: Disposable object that can be used to unbind the delegate.
    public func setDelegate(_ delegate: ARSessionDelegate)
        -> Disposable {
            return RxARSessionDelegateProxy.installForwardDelegate(delegate, retainDelegate: false, onProxyForObject: self.base)
    }
    
    // MARK:- ARSessionDelegate : ARSessionObserver
    
    // Reactive wrapper for delegate method `session(_ session: ARSession, didUpdate frame: ARFrame)`
    public var didUpdateFrame: ControlEvent<ARFrame> {
        let source = delegate
            .methodInvoked(#selector(ARSessionDelegate.session(_:didUpdate:)))
            .map { value -> ARFrame in
                return try castOptionalOrThrow(ARFrame.self, value[1] as AnyObject)
        }
        return ControlEvent(events: source)
    }

    // MARK:- ARSessionObserver
    
    
    
}
