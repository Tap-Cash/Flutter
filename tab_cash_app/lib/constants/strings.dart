// create the base url and all end points
class AppEndPoints {
  // base url
  static const String baseUrl = 'https://tap-cash.onrender.com/';

  // my endpoints
  static const String loginUrl = '${baseUrl}auth/login';
  static const String registerUrl = '${baseUrl}auth/register';
  static const String usersUrl = '${baseUrl}users/';
  static const String usersIdUrl = '${baseUrl}users/id/';
  static const String usersPhoneUrl = '${baseUrl}users/phone/';

  // test data
  static const String testphone = "01144474054";
  static const String testphone2 = "01144474054";
  static const String testId = "1f5d0788-d219-45ee-8484-7fa76905ea79";
}

class AppRouterStrings {
  // app routing strings to avoid missbilling and make the code readable
  static const String loginRouteString = '/';
  static const String navigationBarRouteString = '/navigation_bar';
  static const String passwordRouteString = '/password';
  static const String signupRouteString = '/signup';
}
