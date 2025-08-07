package com.example.flutter_urovo_scan

import android.device.IccManager
import io.flutter.plugin.common.MethodChannel

/**
 * Helper class to interact with [IccManager].
 * Provides wrapper methods that return results via a [MethodChannel.Result].
 */
class IccManagerHelper {
    private val iccManager: IccManager = IccManager()

    fun open(slot: Int, cardType: Int, volt: Int, result: MethodChannel.Result) {
        try {
            val ret = iccManager.open(slot.toByte(), cardType.toByte(), volt.toByte())
            if (ret == 0) {
                result.success("SUCCESS")
            } else {
                result.error("ERROR", "open failed: $ret", null)
            }
        } catch (e: Exception) {
            result.error("ERROR", "open exception: ${e.message}", null)
        }
    }

    fun close(result: MethodChannel.Result) {
        try {
            val ret = iccManager.close()
            if (ret == 0) {
                result.success("SUCCESS")
            } else {
                result.error("ERROR", "close failed: $ret", null)
            }
        } catch (e: Exception) {
            result.error("ERROR", "close exception: ${e.message}", null)
        }
    }

    fun detect(result: MethodChannel.Result) {
        try {
            val ret = iccManager.detect()
            if (ret == 0) {
                result.success("SUCCESS")
            } else {
                result.error("ERROR", "detect failed: $ret", null)
            }
        } catch (e: Exception) {
            result.error("ERROR", "detect exception: ${e.message}", null)
        }
    }

    fun activate(result: MethodChannel.Result) {
        try {
            val atr = ByteArray(64)
            val len = iccManager.activate(atr)
            if (len >= 0) {
                result.success(toHex(atr.copyOf(len)))
            } else {
                result.error("ERROR", "activate failed: $len", null)
            }
        } catch (e: Exception) {
            result.error("ERROR", "activate exception: ${e.message}", null)
        }
    }

    fun apduTransmit(cmd: ByteArray, result: MethodChannel.Result) {
        try {
            val rsp = ByteArray(256)
            val sw = ByteArray(2)
            val len = iccManager.apduTransmit(cmd, cmd.size, rsp, sw)
            if (len >= 0) {
                val map = HashMap<String, Any>()
                map["rsp"] = rsp.copyOf(len).toList()
                map["sw"] = sw.toList()
                result.success(map)
            } else {
                result.error("ERROR", "apduTransmit failed: $len", null)
            }
        } catch (e: Exception) {
            result.error("ERROR", "apduTransmit exception: ${e.message}", null)
        }
    }

    fun deactivate(result: MethodChannel.Result) {
        try {
            val ret = iccManager.deactivate()
            if (ret == 0) {
                result.success("SUCCESS")
            } else {
                result.error("ERROR", "deactivate failed: $ret", null)
            }
        } catch (e: Exception) {
            result.error("ERROR", "deactivate exception: ${e.message}", null)
        }
    }

    private fun toHex(data: ByteArray): String {
        return data.joinToString("") { String.format("%02X", it) }
    }
}

