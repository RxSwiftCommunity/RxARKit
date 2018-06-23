//
//  RxARSessionObserverProxy.swift
//  RxARKit
//
//  Created by Maxim Volgin on 23/06/2018.
//  Copyright © 2018 Maxim Volgin. All rights reserved.
//

import ARKit
import RxSwift
import RxCocoa

open class RxARSessionObserverProxy:
//    DelegateProxy<ARSession, ARSessionObserver>,
//    DelegateProxyType,
    NSObject,
    ARSessionObserver {
    
    /// Typed parent object.
    public weak private(set) var session: ARSession?
    
//    /// - parameter session: Parent object for delegate proxy.
//    public init(session: ParentObject) {
//        self.session = session
//        super.init(parentObject: session, delegateProxy: RxARSessionObserverProxy.self)
//    }
//
//    // Register known implementationss
//    public static func registerKnownImplementations() {
//        self.register { RxARSessionObserverProxy(session: $0) }
//        // TODO: SCN, SK
//
//    }
}
