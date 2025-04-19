package com.screenshotlistener

import android.content.Context
import android.database.ContentObserver
import android.net.Uri
import android.os.Handler
import android.os.Looper
import android.provider.MediaStore
import android.util.Log
import com.facebook.react.bridge.ReactApplicationContext
import com.facebook.react.bridge.ReactContextBaseJavaModule
import com.facebook.react.bridge.ReactMethod
import com.facebook.react.modules.core.DeviceEventManagerModule

class ScreenshotListenerModule(private val reactContext: ReactApplicationContext) :
    ReactContextBaseJavaModule(reactContext) {

    private var screenshotObserver: ContentObserver? = null

    override fun getName(): String = "ScreenshotListener"

    @ReactMethod
    fun startListening() {
        if (screenshotObserver != null) return

        screenshotObserver = object : ContentObserver(Handler(Looper.getMainLooper())) {
            override fun onChange(selfChange: Boolean, uri: Uri?) {
                super.onChange(selfChange, uri)
                uri ?: return

                val path = getPathFromUri(uri)
                if (path != null && isScreenshotPath(path)) {
                    Log.d("ScreenshotListener", "스크린샷 감지됨: $path")
                    sendEvent("ScreenshotTaken", null)
                }
            }
        }

        reactContext.contentResolver.registerContentObserver(
            MediaStore.Images.Media.EXTERNAL_CONTENT_URI,
            true,
            screenshotObserver!!
        )
    }

    private fun getPathFromUri(uri: Uri): String? {
        val projection = arrayOf(MediaStore.Images.Media.DATA)
        reactContext.contentResolver.query(uri, projection, null, null, null)?.use { cursor ->
            val columnIndex = cursor.getColumnIndexOrThrow(MediaStore.Images.Media.DATA)
            if (cursor.moveToFirst()) {
                return cursor.getString(columnIndex)
            }
        }
        return null
    }

    private fun isScreenshotPath(path: String): Boolean {
        return path.lowercase().contains("screenshot")
    }

    private fun sendEvent(eventName: String, params: Any?) {
        reactContext
            .getJSModule(DeviceEventManagerModule.RCTDeviceEventEmitter::class.java)
            .emit(eventName, params)
    }
}
