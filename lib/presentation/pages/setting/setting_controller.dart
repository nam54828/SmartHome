import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:smarthome/presentation/pages/select_language/select_language_controller.dart';
import 'package:url_launcher/url_launcher.dart';


class SettingController extends GetxController{

  final selectLanguageCtrl = Get.find<SelectLanguageController>();

  Future<void> shareFriend() async {
    await Share.shareWithResult('https://pub.dev/');
  }

  Future<void> launchPrivacy() async {
    const privacyUrl = 'https://docs.google.com/document/d/e/2PACX-1vSV5Mf3hbpvtPP3xHidymzMbgcPyuN9eHI0TmlEQ0Sm1CkDjBX6rPqNFT9uTLBVgR4NtqrSL2Ja9Lq-/pub';
    if (await canLaunch(privacyUrl)) {
      await launch(privacyUrl);
    } else {
      throw 'Could not privacy $privacyUrl';
    }
  }

  Future<void> launchTerm() async {
    const termUrl = 'https://static.nerdai.app/terms-conditions-en.html';
    if (await canLaunch(termUrl)) {
      await launch(termUrl);
    } else {
      throw 'Could not term $termUrl';
    }
  }
  Future<void> launchCommunity() async {
    const communityUrl = 'https://static.nerdai.app/community-en.html';
    if (await canLaunch(communityUrl)) {
      await launch(communityUrl);
    } else {
      throw 'Could not community $communityUrl';
    }
  }

  Future<void> launchCodeWay() async {
    const codeWayUrl = 'https://www.codeway.co/';
    if (await canLaunch(codeWayUrl)) {
      await launch(codeWayUrl);
    } else {
      throw 'Could not code way $codeWayUrl';
    }
  }

}