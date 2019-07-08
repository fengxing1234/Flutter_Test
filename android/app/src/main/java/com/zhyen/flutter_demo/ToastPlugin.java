package com.zhyen.flutter_demo;

import android.app.Activity;
import android.util.Log;
import android.widget.Toast;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.PluginRegistry;


public class ToastPlugin implements MethodChannel.MethodCallHandler {
    public static final String TOAST_CHANNEL_NAME = "com.zhyen.flutter_demo/toast";

    private static final String METHOD_SHOW_TOAST = "showToast";
    private static final String TAG = ToastPlugin.class.getSimpleName();
    private Activity mActivity;

    public ToastPlugin(Activity activity) {
        this.mActivity = activity;
    }

    public static void register(PluginRegistry.Registrar registrar) {
        MethodChannel channel = new MethodChannel(registrar.messenger(), TOAST_CHANNEL_NAME);
        ToastPlugin toastPlugin = new ToastPlugin(registrar.activity());
        channel.setMethodCallHandler(toastPlugin);
    }

    @Override
    public void onMethodCall(MethodCall methodCall, MethodChannel.Result result) {
        Log.d(TAG, "onMethodCall: " + methodCall.method);
        Log.d(TAG, "onMethodCall: " + methodCall.arguments.toString());
        switch (methodCall.method) {
            case METHOD_SHOW_TOAST:
                showToast(methodCall.argument("msg"), methodCall.argument("time"));
                result.success("成功");
                break;
        }
    }

    private void showToast(String msg, String time) {
        if ("1".equals(time)) {
            Toast.makeText(mActivity.getApplicationContext(), msg, Toast.LENGTH_LONG).show();
        } else {
            Toast.makeText(mActivity.getApplicationContext(), msg, Toast.LENGTH_SHORT).show();
        }

    }
}
