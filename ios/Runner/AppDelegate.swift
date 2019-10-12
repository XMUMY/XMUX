import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        GeneratedPluginRegistrant.register(with: self);
        
        let controller : FlutterViewController = window?.rootViewController as! FlutterViewController;
        let ipChannel = FlutterMethodChannel.init(name: "OSUtilities",
                                                  binaryMessenger: controller as! FlutterBinaryMessenger);
        ipChannel.setMethodCallHandler({
            (call: FlutterMethodCall, result: FlutterResult) -> Void in
            if ("getIPAddress" == call.method) {
                receiveIPAddress(result: result);
            } else {
                result(FlutterMethodNotImplemented);
            }
        });
        
        return super.application(application, didFinishLaunchingWithOptions: launchOptions);
    }}
private func receiveIPAddress(result: FlutterResult) {
    var address: String?
    var ifaddr: UnsafeMutablePointer<ifaddrs>? = nil
    if getifaddrs(&ifaddr) == 0 {
        var ptr = ifaddr
        while ptr != nil {
            defer { ptr = ptr?.pointee.ifa_next }
            
            let interface = ptr?.pointee
            let addrFamily = interface?.ifa_addr.pointee.sa_family
            if addrFamily == UInt8(AF_INET) || addrFamily == UInt8(AF_INET6) {
                
                if let name: String = String(cString: (interface?.ifa_name)!), name == "en0" {
                    var hostname = [CChar](repeating: 0, count: Int(NI_MAXHOST))
                    getnameinfo(interface?.ifa_addr, socklen_t((interface?.ifa_addr.pointee.sa_len)!), &hostname, socklen_t(hostname.count), nil, socklen_t(0), NI_NUMERICHOST)
                    address = String(cString: hostname)
                }
            }
        }
        freeifaddrs(ifaddr)
    }
    if let theIpAddress: String = address{
        result(theIpAddress)
    }else{
        result(FlutterError.init(code:"UNAVAILABLE",
                                 message:"IPADDRESS info unavailable",
                                 details: nil));
    }
}

