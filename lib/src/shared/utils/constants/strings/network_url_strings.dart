// ignore_for_file: constant_identifier_names

class CredBevUrls{
  const CredBevUrls._();

  static const String BASE_URL = 'https://api-staging.mealtrips.com/api';


  //////////////////////////////////
  ////////[ ENDPOINTS ]/////////////
  //////////////////////////////////

  static const CLOUDINARY_URL = 'https://api.cloudinary.com/v1_1/mealtrips/upload';

  static String getPlaces(String text) =>
      "https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$text&key=AIzaSyDTbU6Le1L7omof-cWnwQHWBkaclufihaw&components=country:ng&location=7.7336%2C8.5396&radius=9000&strictbounds=false";
  static String getAPlaceDetails(String text) =>
      "https://maps.googleapis.com/maps/api/place/details/json?placeid=$text&key=AIzaSyDTbU6Le1L7omof-cWnwQHWBkaclufihaw";

  static const PRIVACY_POLICY = 'https://mealtrips-web.vercel.app/privacy-policy';

  static const TERMS_CONDITIONS = 'https://mealtrips-web.vercel.app/terms';


  static const REGISTER = '/register';
  static const LOGIN = '/login';
  static const LOGOUT = '/account/logout';
  static const VERIFY_EMAIL = '/verify-email';
  static const RESEND_EMAIL_VRFCTN_CODE = '/resend-verify-code';
  static const REQUEST_RESET_PSWRD = '/request-reset-password';
  static const VERIFY_RESET_PSWRD_CODE = '/verify-password-code';
  static const RESET_PASSWORD = '/reset-password-mobile';
  static const GOOGLE_AUTH = '/login/mobile';
  static const GET_USER_PROFILE = '/account/profile';

  static const ALL_COUNTRIES = '/countries/all';
  static const STATES_IN_NIGERIA = '/states/';
  static const LGAS_IN_A_STATE = '/lgas/';
  static const BANKS = '/banks';
  static const COMPLETE_VENDOR_PROFILE = '/account/profile/vendor/complete';

  static const CREATE_MEAL = '/account/meal';
  static const PRODUCT_CATEGORIES = '/account/categories/my-categories';
  static const CATEGORIES = '/account/categories';
  static const PRODUCTS = '/account/products';
  static const GET_ALL_PRODUCTS = '/account/products/my-products';
  static const TOPPINGS = '/account/meal-toppings';
  static const GET_ALL_ORDERS = '/account/orders/vendor';
  static const GET_A_SINGLE_ORDER = '/account/orders/vendor/';
  static const ACCEPT_ORDER = '/account/order/accept/';
  static const REJECT_ORDER = '/account/order/reject/';
  static const GET_RIDER_STATUS_FOR_ORDER = '/account/vendor/request-dispatch/get-status/';
  static const GET_WALLET_BALANCE = '/account/wallet';

  static const GET_VENDOR_TXNS = '/account/transactions';
  static const GET_OPENING_HOURS = '/account/opening-hours';
  static const GET_TODAY_AVAILABILITY = '/account/vendors/my-opening-hour-today';
  static const GET_TOP_SALES = '/account/vendors/top-sale';
  static const REQUEST_DISPATCHER = '/account/vendor/request-dispatch/';
  static const ACTIVATE_PRODUCT = '/account/products/activate/';
  static const DELETE_PRODUCT = '/account/products/delete/';
  static const DEACTIVATE_PRODUCT = '/account/products/deactivate/';
  static const CLOSE_OR_OPEN_SHOP = '/account/vendors/open-close';
  static const UPDATE_PRSNL_DETAILS = '/account/profile/vendor';
  static const UPDATE_BIZ_DETAILS = '/account/vendors/update-business';

  static const NOTIFICATIONS = '/account/notifications';
  static const DELETE_ALL_NOTIFICATIONS = '/account/notifications/all';
  static const SELECTED_NOTIFICATIONS = '/account/notifications/selected';
  static const SHOW_SELECTED_NOTIFICATON = '/account/notifications/';
  static const FETCH_VOUCHERS = '/account/coupons/my-coupons';
  static const TOGGLE_OR_DELETE_VOUCHER = '/account/coupons/';
  static const CREATE_VOUCHER = '/account/coupons';

  static const GET_REFERRALS = '/account/referrals';
  static const GET_ACTIVE_PROGRAMS = '/account/referrals/programs';
  static const GET_REFFERAL_CODE = '/account/referrals/referral-code';
  static const GET_EARNINGS = '/account/referrals/programs/my-earnings/';
  static const GET_CALL_NO = '/support/call';
  static const GET_CHAT_NO = '/support/whatsapp';
  static const GET_VENDOR_IS_ACTIVE = '/account/profile/user-online';
}