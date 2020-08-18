package com.soaic.flutterapp;

import android.app.AlertDialog;
import android.content.DialogInterface;
import android.os.Bundle;
import android.widget.Toast;

import com.honeywell.scanner.sdk.common.DeviceConnectionManager;

import io.flutter.app.FlutterActivity;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugins.GeneratedPluginRegistrant;
import io.flutter.plugin.common.MethodChannel;

public class MainActivity extends FlutterActivity {
  @Override
  protected void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
    GeneratedPluginRegistrant.registerWith(this);

    MethodChannel methodChannel = new MethodChannel(getFlutterView(), "com.example.platform_channel/dialog");//2
    methodChannel.setMethodCallHandler(new MethodChannel.MethodCallHandler() {//3
      @Override
      public void onMethodCall(MethodCall methodCall, MethodChannel.Result result) {
        if ("dialog".equals(methodCall.method)) {
          if (methodCall.hasArgument("content")) {
            showAlertDialog();
            result.success("弹出成功");
          } else {
            result.error("error", "弹出失败", "content is null");
          }
        } else {
          result.notImplemented();
        }
      }
      private void showAlertDialog() {
        AlertDialog.Builder builder = new AlertDialog.Builder(MainActivity.this);
        builder.setPositiveButton("确定", new DialogInterface.OnClickListener() {
          @Override
          public void onClick(DialogInterface dialog, int which) {
            test();
          }
        });
        builder.setTitle("Flutter调用Android");
        builder.show();
      }

      private void test() {
        Toast.makeText(getApplicationContext(),"test", Toast.LENGTH_LONG).show();
      }
    });

  }
}
