package org.ctbeta.xmux.xmux

import android.os.Bundle

import io.flutter.app.FlutterActivity
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity() : FlutterActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        GeneratedPluginRegistrant.registerWith(this)
        MethodChannel(flutterView, "OSUtilities").setMethodCallHandler { call, result ->
            if (call.method == "getIPAddress") {
                val ip = OSUtilities.getIPAddress(true)
                if (ip!="") {
                    result.success(ip)
                } else {
                    result.error("UNAVAILABLE", "Not available.", null)
                }
            } else {
                result.notImplemented()
            }
        }
    }
}
