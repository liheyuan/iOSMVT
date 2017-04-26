# iOSMVT

## Purpose
iOSMVT is an demo project.It is used to show the most common problem in iOS Native App Development.
The ui and logic are reduced to minimal, just to show Minimum viable technology in iOS Native App Development.

### Technology Stack
* Architecture: TabbarController->NavigationController->ViewController
* Autolayout: SnapKit
* Network: Alamofire
* Serialize/Deserialize: ObjectMapper
* Refresh & LoadMore: MJRefresh
* Toast: ToastSwift 

## How to run
```
cd iOSMVT
carthage bootstrap --platform iOS --no-use-binaries --verbose
```

## Resource
* Icon https://iconmonstr.com

### Version History
* 0.1 TabBarViewController
* 0.2 BaseViewController & Custom NavigationBar
* 0.3 Add network & serialize/deserialize framework
* 0.4 dynamic tab controller login/out
* 0.5 mj refresh & loadmore demo
* 0.6 add Eureka as form solution / maintabbar not allow rotate, other vc can be setting to rotate
