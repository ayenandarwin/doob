import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:doob/utils/ok_dialog.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionHandler {
  Future<bool> requestPermissions() async {
    DeviceInfoPlugin plugin = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      AndroidDeviceInfo android = await plugin.androidInfo;
      if (android.version.sdkInt < 33) {
        return requestOldAndroidPermisssionAndIOS();
      } else {
        Map<Permission, PermissionStatus> statuses = await [
          Permission.audio,
          Permission.videos,
          //Permission.notification
        ].request();
        if (statuses[Permission.videos] == PermissionStatus.granted &&
            statuses[Permission.audio] == PermissionStatus.granted) {
          return true;
        } else if (statuses[Permission.videos] ==
                PermissionStatus.permanentlyDenied ||
            statuses[Permission.audio] == PermissionStatus.permanentlyDenied) {
          showPermissionDialog(false, true);
        } else if (statuses[Permission.videos] == PermissionStatus.denied ||
            statuses[Permission.audio] == PermissionStatus.denied) {
          showPermissionDialog(false, false);
        }
      }
    }

    if (Platform.isIOS) {
      //IosDeviceInfo ios = await plugin.iosInfo;
      print('is ios');
      return requestOldAndroidPermisssionAndIOS();
    }
    return false;
  }

  Future<bool> requestOldAndroidPermisssionAndIOS() async {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.storage,
    ].request();
    print(statuses);
    if (statuses[Permission.storage] == PermissionStatus.granted) {
      return true;
    } else if (statuses[Permission.storage] ==
        PermissionStatus.permanentlyDenied) {
      showPermissionDialog(true, true);
    } else {
      showPermissionDialog(true, false);
    }
    return false;
  }

  // Future<void> requestNotificationPermission() async {
  //   DeviceInfoPlugin plugin = DeviceInfoPlugin();
  //   AndroidDeviceInfo android = await plugin.androidInfo;
  //   if (android.version.sdkInt >= 33) {
  //     Map<Permission, PermissionStatus> statuses =
  //         await [Permission.notification].request();
  //     if (statuses[Permission.notification] ==
  //         PermissionStatus.permanentlyDenied) {
  //       openAppSettings();
  //     }
  //   }
  // }

  showPermissionDialog(bool isMin, bool isOpenSetting) {
    Get.dialog(
      OkDialog(
        title: 'Permission',
        description: isMin
            ? 'Please grant permission for storage so that you can utilize the features.'
            : 'Please grant permission for video and audio so that you can utilize the features.',
        buttonTextOk: 'Ok',
        onSelectedOk: () async {
          Get.back();
        },
      ),
    ).then((value) async {
      if (isOpenSetting) {
        openAppSettings().then((value) {
          requestPermissions();
        });
      } else {
        requestPermissions();
      }
    });
  }

  // showMediaPermissionDialog(bool isMin, bool isOpenSetting) {
  //   Get.dialog(
  //     OkDialog(
  //       title: 'Permission',
  //       description: isMin
  //           ? 'Please grant permission for storage so that you can utilize the features.'
  //           : 'Please grant permission for video and audio so that you can utilize the features.',
  //       buttonTextOk: 'Ok',
  //       onSelectedOk: () async {
  //         Get.back();
  //       },
  //     ),
  //   ).then((value) async {
  //     if (isOpenSetting) {
  //       openAppSettings().then((value) {
  //         requestMediaPermission();
  //       });
  //     } else {
  //       requestMediaPermission();
  //     }
  //   });
  // }
}
