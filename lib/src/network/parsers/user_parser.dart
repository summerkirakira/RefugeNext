import 'package:html/parser.dart' as html_parser;
import 'package:html/dom.dart';
import 'package:intl/intl.dart';
import '../../datasource/models/user.dart';
import '../../network/api_service.dart';

Future<User?> parseNewUser(String email, String password, String? rsiDevice, String? rsiToken) async {

  final rsiClient = RsiApiClient();

  if (rsiToken != null) {
    rsiClient.setRSIToken(token: rsiToken);
  }
  if (rsiDevice != null) {
    rsiClient.setRSIDevice(device: rsiDevice);
  }

  await rsiClient.refreshCsrfToken();

  var referralPage = await rsiClient.getPage('account/referral-program');
  Document referralDoc = html_parser.parse(referralPage);
  String? userName = referralDoc.querySelector('.c-account-sidebar__profile-info-displayname')?.text;
  String? userHandle = referralDoc.querySelector('.c-account-sidebar__profile-info-handle')?.text;
  String? userCreditsString = referralDoc.querySelector('.c-account-sidebar__profile-info-credits-amount--pledge')?.text
      .replaceAll('\$', '')
      .replaceAll(' ', '')
      .replaceAll('USD', '')
      .replaceAll(',', '');
  String? userUECString = referralDoc.querySelector('.c-account-sidebar__profile-info-credits-amount--uec')?.text
      .replaceAll('¤', '')
      .replaceAll(' ', '')
      .replaceAll('UEC', '')
      .replaceAll(',', '');
  String? userRECString = referralDoc.querySelector('.c-account-sidebar__profile-info-credits-amount--rec')?.text
      .replaceAll('¤', '')
      .replaceAll(' ', '')
      .replaceAll('REC', '')
      .replaceAll(',', '');
  String? recruitNumberString = referralDoc.querySelector('div.progress')?.querySelector('.label')?.text
      .replaceAll('Total recruits: ', '');
  String? totalReferralNumberString = referralDoc.querySelector('a[href="/account/referral-program"][data-type="pending"]')?.text
      .replaceAll('Prospects (', '')
      .replaceAll(')', '');
  String? referralCode = referralDoc.querySelector('#share-referral-form')?.querySelector('input')?.attributes['value'];

  var billingPage = await rsiClient.getPage('account/billing');

  Document billingDoc = html_parser.parse(billingPage);
  if (userHandle == null) {
    return null;
  }

  String? totalSpentString = billingDoc.querySelector('#billing > div.content.inner-content.clearfix > div:nth-child(12)')?.text
      .replaceAll('\$', '')
      .replaceAll(' ', '')
      .replaceAll('USD', '')
      .replaceAll(',', '');

  var userInfoPage = await rsiClient.getPage('citizens/$userHandle');

  Document userInfoDoc = html_parser.parse(userInfoPage);
  String? userImage = userInfoDoc.querySelector('.left-col')?.querySelector('.thumb img')?.attributes['src'];
  String? enlisted = userInfoDoc.querySelector('.left-col')?.children.last.querySelector('.entry strong')?.text;
  String? orgName = userInfoDoc.querySelector('.right-col')?.querySelector('.entry a')?.text;
  String? orgLogoUrl = userInfoDoc.querySelector('.right-col')?.querySelector('.thumb img')?.attributes['src'];
  String? orgRank = userInfoDoc.querySelector('.right-col')?.querySelectorAll('.entry')[2].querySelector('strong')?.text;
  String? orgIdString = userInfoDoc.querySelector('.right-col')?.querySelector('.thumb a')?.attributes['href']?.split('/')[1];
  int orgLevel = 0;
  var rankList = userInfoDoc.querySelector('.ranking')?.querySelectorAll('span');

  if (rankList != null) {
    for (var item in rankList) {
      String? activeString = item.attributes['class'];
      if (activeString == null) {
        continue;
      }
      if (activeString == 'active') {
        orgLevel++;
      }
    }
  }

  if (userImage == null || userHandle == null || referralCode == null || recruitNumberString == null || totalReferralNumberString == null || userCreditsString == null || userUECString == null || userRECString == null || totalSpentString == null || enlisted == null) {
    return null;
  }

  if (userImage.startsWith('/')) {
    userImage = 'https://robertsspaceindustries.com$userImage';
  }

  if (orgLogoUrl != null && orgLogoUrl.startsWith('/')) {
    orgLogoUrl = 'https://robertsspaceindustries.com$orgLogoUrl';
  }

  DateFormat dateFormatter = DateFormat('MMM dd, yyyy, "en_US"');
  DateTime registerTime = dateFormatter.parse(enlisted);
  dateFormatter = DateFormat('yyyy年MM月dd日', "zh_CN");
  String registerTimeString = dateFormatter.format(registerTime);

  String? rsiTokenFinal = rsiToken ?? rsiClient.rsiToken;

  User newUser = User(
    handle: userHandle,
    name: userName!,
    email: email,
    password: password,
    rsiToken: rsiTokenFinal!,
    profileImage: userImage,
    referralCode: referralCode,
    referralCount: int.parse(recruitNumberString),
    referralProspectCount: int.parse(totalReferralNumberString),
    usd: (double.parse(userCreditsString) * 100).toInt(),
    uec: int.parse(userUECString),
    rec: int.parse(userRECString),
    hangarValue: 0,
    currentHangarValue: 0,
    totalSpent: (double.parse(totalSpentString) * 100).toInt(),
    organization: orgIdString,
    organizationName: orgName,
    organizationImage: orgLogoUrl,
    orgRank: orgRank,
    orgLevel: orgLevel,
    registerTime: registerTime,
    registerTimeString: registerTimeString,
  );

  return newUser;
}

