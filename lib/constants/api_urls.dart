//String rootUrl = "http://10.0.2.2/meet_god_daily_api/src/Api";
String rootUrl = "http://192.168.150.134:3150/src/Api";

String registrationUrl = '$rootUrl/User/CreateUser.php';
String loginUrl = '$rootUrl/User/AuthenticateUser.php';
String todayDevotion = '$rootUrl/Devotion/GetTodaysDevotion.php?id=';
String pastDevotions = '$rootUrl/Devotion/GetPastDevotions.php';
String payment = '$rootUrl/Payment/GetAllPaymentsForUser.php?id=';
String initiatePaymentUrl = '$rootUrl/Payment/InitiatePayment.php';
String OtpLoginUrl = '$rootUrl/User/OTPLogin.php';
