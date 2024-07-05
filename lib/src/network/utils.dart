String? extractCsrfToken(String page) {
  if (page.split('csrf-token" content="').length <= 1) {
    return null;
  }
  String csrfToken = page.split('csrf-token" content="')[1].split('"')[0];
  return csrfToken;
}