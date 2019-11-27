import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        GeneratedPluginRegistrant.register(with: self)
        let viewFactory = MyFlutterPlatformViewFactory()
        registrar(forPlugin: "Kitty").register(viewFactory, withId: "MyFlutterView")
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
}

class MyFlutterPlatformViewFactory: NSObject, FlutterPlatformViewFactory {
    func create(withFrame frame: CGRect, viewIdentifier viewId: Int64, arguments args: Any?) -> FlutterPlatformView {
        return MyFlutterPlatformView(frame, viewId: viewId, args: args)
    }
    
    deinit {
        print("MyFlutterPlatformViewFactory deinit")
    }
}

class MyFlutterPlatformView: NSObject, FlutterPlatformView  {
    let frame: CGRect
    let viewId: Int64
    let myView: MyFlutterView
    
    init(_ frame: CGRect, viewId: Int64, args: Any?) {
        self.frame = frame
        self.viewId = viewId
        self.myView =  MyFlutterView(frame: frame)
    }
    
    func view() -> UIView {
        return myView
    }
    
    deinit {
        print("MyFlutterPlatformView deinit")
    }
}

class MyFlutterView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.red
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        print("MyFlutterView deinit")
    }
}
