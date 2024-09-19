import 'package:html/parser.dart' as parser;
import 'package:html/dom.dart';
import 'package:refuge_next/src/network/api_service.dart';

class PlayerSearchResult {
  final String name;
  final String image;
  final String handle;
  final String enlisted;
  final String? location;
  final String fluency;
  final Organization? organization;
  final bool isHidden;

  PlayerSearchResult({
    required this.name,
    required this.image,
    required this.handle,
    required this.enlisted,
    this.location,
    required this.fluency,
    this.organization,
    required this.isHidden,
  });
}

class Organization {
  final String name;
  final String id;
  final int rank;
  final String rankName;
  final String logo;

  Organization({
    required this.name,
    required this.id,
    required this.rank,
    required this.rankName,
    required this.logo,
  });
}

PlayerSearchResult? playerParser(String page) {
  if (page.contains("You are currently venturing unknown space")) {
    return null;
  }

  final doc = parser.parse(page);
  String image = doc.querySelector(".left-col.profile .thumb img")?.attributes['src'] ?? '';
  final name = doc.querySelector(".left-col.profile .entry:first-child strong")?.text ?? '';

  if (image.startsWith('/')) {
    image = 'https://robertsspaceindustries.com$image';
  }

  final leftInfoList = doc.querySelectorAll(".left-col.profile .entry").map(
          (e) => e.querySelector('.value')?.text ?? ""
  ).toList();

  final handle = leftInfoList[1] ?? '';
  
  
  final leftBottomInfoList = doc.querySelectorAll("div.left-col")[1].querySelectorAll(".entry").map(
          (e) => e.querySelector('.value')?.text.replaceAll("\n", "").trim() ?? ""
  ).toList();
  
  final enlisted = leftBottomInfoList[0] ?? '';

  String location = leftBottomInfoList[1].replaceAll(" ", "").replaceAll(',', ", ");
  String fluency = leftBottomInfoList[2] ?? '';

  if (doc.querySelector(".member-visibility-restriction") != null) {
    return PlayerSearchResult(
      name: name,
      image: image,
      handle: handle,
      enlisted: enlisted,
      location: location,
      fluency: fluency,
      organization: null,
      isHidden: true,
    );
  }

  if (page.contains("NO MAIN ORG FOUND IN PUBLIC RECORDS")) {
    return PlayerSearchResult(
      name: name,
      image: image,
      handle: handle,
      enlisted: enlisted,
      location: location,
      fluency: fluency,
      organization: null,
      isHidden: false,
    );
  }

  String logo = doc.querySelector(".right-col .thumb img")?.attributes['src'] ?? '';
  final orgId = doc.querySelector(".right-col .thumb a")?.attributes['href']?.split('/')[2] ?? '';
  final orgName = doc.querySelector(".right-col .entry:first-child a")?.text ?? '';
  final orgRankList = doc.querySelectorAll(".ranking span");
  int orgRank = orgRankList.where((element) => element.classes.contains('active')).length;
  final orgRankName = doc.querySelector(".right-col .entry:nth-child(3) strong")?.text ?? '';

  if (logo.startsWith('/')) {
    logo = 'https://robertsspaceindustries.com$logo';
  }

  return PlayerSearchResult(
    name: name,
    image: image,
    handle: handle,
    enlisted: enlisted,
    location: location,
    fluency: fluency,
    organization: Organization(
      name: orgName,
      id: orgId,
      rank: orgRank,
      rankName: orgRankName,
      logo: logo,
    ),
    isHidden: false,
  );
}

Future<PlayerSearchResult?> getPlayerSearchResult(String handle) async {
  try {
    final page = await RsiApiClient().getPlayerInfoPage(handle.trim());
    return playerParser(page);
  } catch (e) {
    return null;
  }
}