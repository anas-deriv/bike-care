enum PAGES {
  // Entry Pages
  loadingUser,
  login,
  register,

  // User's Pages
  bottomNavigationBar,
  dashboard,
  notification,
  planning,
  profile,
}

// A class to represent information about a page, including its screenPath and screenName.
class PageInfo {
  /// Routing address for user to navigate
  final String screenPath;

  /// Naming as reference for a loading screen
  final String screenName;

  const PageInfo({
    required this.screenPath,
    required this.screenName,
  });
}

// An extension on the PAGES enum to provide a mapping of enum values to PageInfo objects.
extension RouteUtilities on PAGES {
  // A static map that associates each PAGES enum value with its PageInfo object.
  static const Map<PAGES, PageInfo> pageDetails = {
    // Entry Pages
    PAGES.login: PageInfo(
      screenPath: "/login",
      screenName: "LOGIN",
    ),
    PAGES.loadingUser: PageInfo(
      screenPath: "/loadingUser",
      screenName: "LOADING USER",
    ),
    // Main page with bottom navigation bar
    PAGES.bottomNavigationBar: PageInfo(
      screenPath: "/bottomNavigationBar",
      screenName: "BOTTOM NAVIGATION BAR",
    ),
    PAGES.dashboard: PageInfo(
      screenPath: "/dashboard",
      screenName: "DASHBOARD",
    ),
    PAGES.notification: PageInfo(
      screenPath: "/notification",
      screenName: "NOTIFICATION",
    ),
    PAGES.planning: PageInfo(
      screenPath: "/planning",
      screenName: "PLANNING",
    ),
    PAGES.profile: PageInfo(
      screenPath: "/profile",
      screenName: "PROFILE",
    ),
  };

  // A getter to retrieve the screenPath for the current PAGES enum value.
  String get screenPath => pageDetails[this]?.screenPath ?? "/error-404";

  // A getter to retrieve the screenName for the current PAGES enum value.
  String get screenName =>
      pageDetails[this]?.screenName ?? "ERROR NOT FOUND: 404";
}
