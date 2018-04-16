package com.yuklyn.flutterapp;

import android.content.Context;
import android.os.Bundle;
import android.util.Log;
import android.widget.Toast;

import com.aliyun.alink.AlinkSDK;
import com.aliyun.alink.business.alink.ALinkEnv;
import com.aliyun.alink.business.login.IAlinkLoginAdaptor;
import com.aliyun.alink.business.login.IAlinkLoginCallback;
import com.aliyun.alink.linksdk.tools.ALog;

import io.flutter.app.FlutterActivity;
import io.flutter.plugins.GeneratedPluginRegistrant;

public class MainActivity extends FlutterActivity {
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        GeneratedPluginRegistrant.registerWith(this);
        Toast.makeText(this, "测试", Toast.LENGTH_SHORT).show();
    }
}
