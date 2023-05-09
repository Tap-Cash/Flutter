// create the base url and all end points
class AppEndPoints {
  static const String baseUrl = 'https://tap-cash.onrender.com/';

  static const String loginUrl = '${baseUrl}auth/login';
  static const String registerUrl = '${baseUrl}auth/register';
  static const String usersUrl = '${baseUrl}users/';
  static const String usersIdUrl = '${baseUrl}users/id/';

  static const String usersPhoneUrl = '${baseUrl}users/phone/';
  static const String testphone = "01144474054";
  static const String testphone2 = "01144474054";
  static const String testId = "1f5d0788-d219-45ee-8484-7fa76905ea79";
}

class AppRouterStrings {
  static const String loginRouteString = '/';
  static const String homeRouteString = '/home';
  static const String passwordRouteString = '/password';
  static const String signupRouteString = '/signup';
}
