package com.zhyen.flutter_demo;

import android.util.Log;

import io.flutter.plugin.common.EventChannel;
import io.flutter.plugin.common.PluginRegistry;

public class FlutterPluginCounter implements EventChannel.StreamHandler {

    public static final String COUNTER_CHANNEL = "com.zhyen.flutter_demo/counter_channel";
    private static final String TAG = FlutterPluginCounter.class.getSimpleName();

    public static void registerWith(PluginRegistry.Registrar registrar) {
        EventChannel channel = new EventChannel(registrar.messenger(), COUNTER_CHANNEL);
        FlutterPluginCounter instance = new FlutterPluginCounter();
        channel.setStreamHandler(instance);
    }

    private int i = 0;

    @Override
    public void onListen(Object o, EventChannel.EventSink eventSink) {

        new Thread() {
            @Override
            public void run() {
                while (i <= 100) {
                    try {
                        eventSink.success(String.valueOf(i++));
                        Thread.sleep(1000);
                    } catch (InterruptedException e) {
                        e.printStackTrace();
                    }
                }
            }
        }.start();
    }

    @Override
    public void onCancel(Object o) {
        Log.d(TAG, "onCancel: ");
    }
}
