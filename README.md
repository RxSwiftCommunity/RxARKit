# RxARKit
RxARKit (based on RxSwift)

Basic usage.

```swift

session
    .rx
    .didUpdateFrame
    .subscribe { event in
        switch event {
        case .next(let didUpdateFrame):
            let frame = didUpdateFrame.frame // ARFrame
            break
        default:
            break
        }
    }
    .disposed(by: disposeBag)
    
session
    .rx
    .cameraDidChangeTrackingState
    .subscribe { event in
    switch event {
        case .next(let cameraDidChangeTrackingState):
            let camera = cameraDidChangeTrackingState.camera // ARCamera
            break
        default:
            break
        }
    }
    .disposed(by: disposeBag)

```

Carthage setup.

```
github "maxvol/RxARKit" ~> 0.0.2

```

