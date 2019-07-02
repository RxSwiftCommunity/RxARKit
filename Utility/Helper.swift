//
//  Helper.swift
//  RxARKit
//
//  Created by Maxim Volgin on 22/06/2018.
//  Copyright (c) RxSwiftCommunity. All rights reserved.
//

#if !RX_NO_MODULE
import RxSwift
import RxCocoa
#endif

func castOrThrow<T>(_ resultType: T.Type, _ object: Any) throws -> T {
    guard let returnValue = object as? T else {
        throw RxCocoaError.castingError(object: object, targetType: resultType)
    }
    return returnValue
}

//func castOptionalOrThrow<T>(_ resultType: T.Type, _ object: AnyObject) throws -> T? {
//    if NSNull().isEqual(object) {
//        return nil
//    }
//    
//    guard let returnValue = object as? T else {
//        throw RxCocoaError.castingError(object: object, targetType: resultType)
//    }
//    
//    return returnValue
//}
