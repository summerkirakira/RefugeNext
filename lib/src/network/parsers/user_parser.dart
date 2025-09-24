import 'package:html/parser.dart' as html_parser;
import 'package:html/dom.dart';
import 'package:intl/intl.dart';
import 'package:refuge_next/src/funcs/shop/recaptcha.dart';
import 'package:refuge_next/src/network/graphql/account/referral_list_query.dart';
import 'package:refuge_next/src/network/graphql/account/referral_query.dart';
import '../../datasource/models/user.dart';
import '../../network/api_service.dart';
import 'package:refuge_next/src/network/graphql/account/account_query.dart';
import 'package:refuge_next/src/network/graphql/account/credit_query.dart';

import '../graphql/account/referral_code_search.dart';

Future<User?> parseNewUser(String email, String password, String? rsiDevice, String? rsiToken) async {

  final rsiClient = RsiApiClient();

  if (rsiToken != null) {
    rsiClient.setRSIToken(token: rsiToken);
  }
  if (rsiDevice != null) {
    rsiClient.setRSIDevice(device: rsiDevice);
  }

  await rsiClient.refreshCsrfToken();

  // var referralPage = await rsiClient.getPage('account/referral-program');
  // Document referralDoc = html_parser.parse(referralPage);

  final accountQuery = await AccountQuery().execute();
  final creditQuery = await CreditQuery().execute();
  var prospectsCount = 0;
  var newReferralsCount = 0;
  try {
    final referralQueryOld = await ReferralListQuery(converted: false, limit: 5, page: 1, campaignId: "1").execute();
    final referralQueryNew = await ReferralListQuery(converted: false, limit: 5, page: 1, campaignId: "2").execute();
    prospectsCount = referralQueryOld.prospectsCount + referralQueryNew.prospectsCount;
    final newReferral = await ReferralCountQuery(campaignId: "2").execute();
    newReferralsCount = newReferral.referralCountByCampaign;
  } catch (e) {

  }


  String? userName = accountQuery.account.displayname;
  String? userHandle = accountQuery.account.nickname;
  int userCredit = creditQuery.ledgerCredit.amount.value;
  int userUEC = creditQuery.ledgerUec.amount.value;
  int userREC = creditQuery.ledgerRec.amount.value; 



  // String? userName = referralDoc.querySelector('.c-account-sidebar__profile-info-displayname')?.text;
  // String? userHandle = referralDoc.querySelector('.c-account-sidebar__profile-info-handle')?.text;
  // String? userCreditsString = referralDoc.querySelector('.c-account-sidebar__profile-info-credits-amount--pledge')?.text
  //     .replaceAll('\$', '')
  //     .replaceAll(' ', '')
  //     .replaceAll('USD', '')
  //     .replaceAll(',', '');
  // String? userUECString = referralDoc.querySelector('.c-account-sidebar__profile-info-credits-amount--uec')?.text
  //     .replaceAll('¤', '')
  //     .replaceAll(' ', '')
  //     .replaceAll('UEC', '')
  //     .replaceAll(',', '');
  // String? userRECString = referralDoc.querySelector('.c-account-sidebar__profile-info-credits-amount--rec')?.text
  //     .replaceAll('¤', '')
  //     .replaceAll(' ', '')
  //     .replaceAll('REC', '')
  //     .replaceAll(',', '');


  RegExp numRegExp = RegExp(r'\((\d+)\)');


  // String? recruitNumberString = referralDoc.querySelector('a[href="/account/referral-program?recruits=1"]')?.text;
  // String? totalReferralNumberString = referralDoc.querySelector('a[href="/account/referral-program"][data-type="pending"]')?.text;
  // if (recruitNumberString != null) {
  //   var match = numRegExp.firstMatch(recruitNumberString);
  //   if (match != null) {
  //     recruitNumberString = match.group(1);
  //   }
  // }
  //
  // if (totalReferralNumberString != null) {
  //   var match = numRegExp.firstMatch(totalReferralNumberString);
  //   if (match != null) {
  //     totalReferralNumberString = match.group(1);
  //   }
  // }

  RegExp referralRegExp = RegExp(r'STAR-[A-Z0-9]{4}-[A-Z0-9]{4}');


  // Iterable<Match> matches = referralRegExp.allMatches(referralPage);


  // String? referralCode = matches.isNotEmpty ? matches.first.group(0) : null;

  var billingPage = await rsiClient.getPage('account/billing');

  Document billingDoc = html_parser.parse(billingPage);
  if (userHandle == null) {
    return null;
  }

  String? totalSpentString = billingDoc.querySelectorAll('.spent-line').last.children[0].text
      .replaceAll('\$', '')
      .replaceAll(' ', '')
      .replaceAll('USD', '')
      .replaceAll(',', '');

  var userInfoPage = await rsiClient.getPage('citizens/$userHandle');

  Document userInfoDoc = html_parser.parse(userInfoPage);
  String? userImage = userInfoDoc.querySelector('.left-col')?.querySelector('.thumb img')?.attributes['src'];
  String? enlisted = userInfoDoc.querySelectorAll('.left-col').last.querySelector('.entry strong')?.text;
  String? orgName = userInfoDoc.querySelector('.right-col')?.querySelector('.entry a')?.text;
  String? orgLogoUrl = userInfoDoc.querySelector('.right-col')?.querySelector('.thumb img')?.attributes['src'];
  String? orgRank = orgLogoUrl == null? null : userInfoDoc.querySelector('.right-col')?.querySelectorAll('.entry')[2].querySelector('strong')?.text;
  String? orgIdString = orgLogoUrl == null? null : userInfoDoc.querySelector('.right-col')?.querySelector('.thumb a')?.attributes['href']?.split('/')[1];
  int orgLevel = 0;
  var rankList = orgLogoUrl == null? null : userInfoDoc.querySelector('.ranking')?.querySelectorAll('span');

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

  // totalReferralNumberString ??= '0';
  // recruitNumberString ??= '0';

  // referralCode ??= '';
  totalSpentString ??= '0';


  if (userImage == null || enlisted == null) {
    return null;
  }

  if (userImage.startsWith('/')) {
    userImage = 'https://robertsspaceindustries.com$userImage';
  }

  if (orgLogoUrl != null && orgLogoUrl.startsWith('/')) {
    orgLogoUrl = 'https://robertsspaceindustries.com$orgLogoUrl';
  }

  DateFormat dateFormatter = DateFormat('MMM dd, yyyy', "en_US");
  DateTime registerTime = dateFormatter.parse(enlisted);
  dateFormatter = DateFormat('yyyy年MM月dd日', "zh_CN");
  String registerTimeString = dateFormatter.format(registerTime);

  String? rsiTokenFinal = rsiToken ?? rsiClient.rsiToken;

  User newUser = User(
    handle: userHandle,
    name: userName,
    email: email,
    password: password,
    rsiToken: rsiTokenFinal,
    profileImage: userImage,
    referralCode: accountQuery.account.referral_code,
    referralCount: accountQuery.account.referral_count,
    referralProspectCount: prospectsCount,
    usd: userCredit,
    uec: userUEC,
    rec: userREC,
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
    referrerReferralCode: accountQuery.account.referrerReferralCode,
    hasBeenReferred: accountQuery.account.hasBeenReferred,
    hasGamePackage: accountQuery.account.hasGamePackage,
    username: accountQuery.account.username,
    newReferralsCount:newReferralsCount
  );

  return newUser;
}

