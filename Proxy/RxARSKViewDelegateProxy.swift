//
//  RxARSKViewDelegateProxy.swift
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

extension ARSKView: HasDelegate {
    public typealias Delegate = ARSKViewDelegate
}

open class RxARSKViewDelegateProxy
    : DelegateProxy<ARSKView, ARSKViewDelegate>
    , DelegateProxyType
, ARSKViewDelegate {
    
    /// Typed parent object.
    public weak private(set) var view: ARSKView?
    
    /// - parameter view: Parent object for delegate proxy.
    public init(view: ParentObject) {
        self.view = view
        super.init(parentObject: view, delegateProxy: RxARSKViewDelegateProxy.self)
    }
    
    // Register known implementationss
    public static func registerKnownImplementations() {
        self.register { RxARSKViewDelegateProxy(view: $0) }
    }
}

