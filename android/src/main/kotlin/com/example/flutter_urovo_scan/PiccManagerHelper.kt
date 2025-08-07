package com.example.flutter_urovo_scan

import android.device.PiccManager
import io.flutter.plugin.common.MethodChannel

/**
 * Helper class to interact with [PiccManager].
 * Provides wrapper methods that return results via a [MethodChannel.Result].
 */
class PiccManagerHelper {
    private val piccManager: PiccManager = PiccManager()

    fun open(result: MethodChannel.Result) {
        try {
            val ret = piccManager.open()
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
            val ret = piccManager.close()
            if (ret == 0) {
                result.success("SUCCESS")
            } else {
                result.error("ERROR", "close failed: $ret", null)
            }
        } catch (e: Exception) {
            result.error("ERROR", "close exception: ${e.message}", null)
        }
    }

    fun request(mode: String, result: MethodChannel.Result) {
        try {
            val atq = ByteArray(16)
            val modeByte = byteArrayOf(mode.first().code.toByte())
            val len = piccManager.request(modeByte, atq)
            if (len >= 0) {
                result.success(toHex(atq.copyOf(len)))
            } else {
                result.error("ERROR", "request failed: $len", null)
            }
        } catch (e: Exception) {
            result.error("ERROR", "request exception: ${e.message}", null)
        }
    }

    fun antisel(result: MethodChannel.Result) {
        try {
            val sn = ByteArray(16)
            val sak = ByteArray(16)
            val len = piccManager.antisel(sn, sak)
            if (len >= 0) {
                result.success(toHex(sn.copyOf(len)))
            } else {
                result.error("ERROR", "antisel failed: $len", null)
            }
        } catch (e: Exception) {
            result.error("ERROR", "antisel exception: ${e.message}", null)
        }
    }

    fun activate(result: MethodChannel.Result) {
        try {
            val ret = piccManager.activate()
            if (ret == 0) {
                result.success("SUCCESS")
            } else {
                result.error("ERROR", "activate failed: $ret", null)
            }
        } catch (e: Exception) {
            result.error("ERROR", "activate exception: ${e.message}", null)
        }
    }

    fun deactivate(mode: Int, result: MethodChannel.Result) {
        try {
            val ret = piccManager.deactivate(mode.toByte())
            if (ret == 0) {
                result.success("SUCCESS")
            } else {
                result.error("ERROR", "deactivate failed: $ret", null)
            }
        } catch (e: Exception) {
            result.error("ERROR", "deactivate exception: ${e.message}", null)
        }
    }

    fun apduTransmit(cmd: ByteArray, result: MethodChannel.Result) {
        try {
            val rsp = ByteArray(256)
            val sw = ByteArray(2)
            val len = piccManager.apduTransmit(cmd, cmd.size, rsp, sw)
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

    private fun toHex(data: ByteArray): String {
        return data.joinToString("") { String.format("%02X", it) }
    }
}

