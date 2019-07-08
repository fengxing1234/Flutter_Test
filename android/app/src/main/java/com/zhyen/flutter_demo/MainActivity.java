package com.zhyen.flutter_demo;

import android.os.Bundle;

import java.nio.channels.Channel;

import io.flutter.app.FlutterActivity;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.PluginRegistry;
import io.flutter.plugins.GeneratedPluginRegistrant;

public class MainActivity extends FlutterActivity {
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        GeneratedPluginRegistrant.registerWith(this);
        registerCustomPlugin(this);
    }

    private void registerCustomPlugin(PluginRegistry registry) {
        ToastPlugin.register(registry.registrarFor(ToastPlugin.TOAST_CHANNEL_NAME));
        FlutterPluginCounter.registerWith(registry.registrarFor(FlutterPluginCounter.COUNTER_CHANNEL));
    }

}
