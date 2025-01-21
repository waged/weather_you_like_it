// import '../objects/app_objects.dart';
// class AppStrings {
//   static const String noRouteFound = "No Route Found, something went wrong!";
//   static const String onBoardingTitle1 = "SEND CONTENT TO ME";
//   static const String onBoardingTitle2 = "DESIGN YOUR OWN CONTENT";
//   static const String onBoardingTitle3 = "ADJUST TIMING AND SCHEDULE";
//   static const String onBoardingTitle4 = "LONG LASTING BATTERY";

//   static const String onBoardingSubTitle1 =
//       "Once you connect your frame to the app, you could easily push content to it.";
//   static const String onBoardingSubTitle2 =
//       "You can easily design your content from the app or export your design from gallery.";
//   static const String onBoardingSubTitle3 =
//       "You can schedule content in certain times during the day!";
//   static const String onBoardingSubTitle4 =
//       "Thanks to the E-INK technology, your device can last for weeks with a single charge.";

//   static const String skip = "Skip";
//   static const String next = "Next";
//   static const String back = "Back";
//   static const String cannotNavigate = "Cannot navigate..";
//   static const String assignContentFail = "Assign Content to Frame Failure";
//   static const String assignContentFailDetail =
//       "Assigning the content fail due to system error!";
//   static const String timePicker = "Pick Time";
//   static const String selectContentTime =
//       "Select time for this content to be shown!";
//   static const String or = "____ or ____";
//   static const String lastUpdate = "Last update";
//   static const String skipToWeather =
//       "Skip and use the frame as Weather & Calender!";
//   static const String userPicturePreview =
//       "ℹ️ Upload a picture to the frame and make sure the picture has the right dimensions [480x800]\n\nℹ️ Pictures are mostly preferred to be black and white or grayscale, some screens support color red!";
//   static const String almostFinished = "almost done..";
//   static const String selectContent = "Select Your Content";
//   static const String timeoutFailed = "Failed Timeout";
//   static const String installSuccess = "Installation Succeeded";
//   static const String accountRegisterFailure = "Register Failed!";
//   static const String accountRegisterFailure2 =
//       "Please try to type other email or try to login with this mail!";
//   static const String registerFailure =
//       "Failed to register your device\ncould be the network issue or wrong WiFi credentials";
//   static const String successScan =
//       "keep scanning, searching for your device...";
//   static const String selectCountry = "Select Country";
//   static const String selectDeviceLanguage = "Select Device Language";
//   static const String selectDeviceTimezone = "Select Device Timezone";
//   static const String selectDeviceTimezoneInfo =
//       "MET-1METDS... for Most of Europe\nCET-1CEST,M3...for Central Europe\nEST-2METDS... for Most of Europe\nEST5EDT,M3.2.0...EST USA\nCST6CDT,M3.2.. CST USA\nMST7MDT,M4.1...MST USA\nNZST-12NZDT...Auckland\nEET-2EEST...Asia\nACST-9:30AC.. Australia";
//   static const String selectDayLightOffset = "Select daylight offset in Hours";
//   static const String selectDayLightOffset2 = "Select daylight offset";
//   static const String selectDeviceActive =
//       "Device connected to WiFi every (x) minute(s)";
//   static const String selectDeviceActive2 = "Select device active-time";
//   static const String selectLocation = "Type and select device's location";
//   static const String selectLocation2 =
//       "Only the cities in suggestion that could be selected";
//   static const String selectDayLightOffsetInfo =
//       "UK DST is +1Hr, other countries may use 2Hrs etc..";
//   static const String selectGmtOffset = "Select GMT Offset";
//   static const String selectGmtOffsetInfo =
//       "UK GMT Offset 0, Germany (+1HR) ,for US (-5Hrs), AU is typically (+8hrs)";
//   static const String username = "Username";
//   static const String resetKey = "Reset Key";
//   static const String email = "Email";
//   static const String userNameErr = "Username is wrong!";
//   static const String password = "Password";
//   static const String wifiPassword = "WiFi Password";
//   static const String alreadyHasKey = "have a key?";
//   static const String passwordRetype = "Retype Password";
//   static const String passwordErr = "password is wrong!";
//   static const String login = "Login";
//   static const String forgotPassword = "Forgot password ?";
//   static const String passwordReset = "Password Reset";
//   static const String resetPassword = "Reset Password";
//   static const String notMemberSignup = "Not a member ? Sign up";
//   static const String register = "Register";
//   static const String setNewPassword = "Set New Password";
//   static const String loading = "Loading";
//   static const String successChanged = "changes saved successfully";
//   static const String deviceLanguageInfo =
//       "Select the language you'd like to see on your device!";

//   static const String retryAgain = "retry again";
//   static const String retry = "Retry";
//   static const String noDevicesFound = "No Frames found in this account!";

//   static const String noInternet = "Check internet connection!";
//   static const String noDeviceOrInternet =
//       "No data found in this account \nor\na problem with internet connection!";
//   static const String noCloudMediaFound = "No Media found in this account!";
//   static const String ok = "ok";
//   static const String emailHint = "Enter Email";
//   static const String invalidDeviceName = "invalid device name";
//   static const String invalidEmail = "invalid Email";
//   static const String info = "Info";
//   static const String invalidPassword = "invalid Password";
//   static const String emailSent = "Email Sent!";
//   static const String emailSentText =
//       "follow up the instructions in the email that we've sent you!";
//   static const String invalidUsername = "Invalid username";
//   static const String invalidResetKey = "Invalid reset key";
//   static const String loginSuccess = "Login Success!";
//   static const String loginSuccess2 = "Welcome, you've logged in!";
//   static const String loginFailed = "Login failed!";
//   static const String loginFailed2 =
//       "please make sure you typed the right email and password!";
//   static const String pressAgainExit = 'press again to exit!';
//   static const String stepsTConnectToDevice =
//       "Steps to connect to your device:";
//   static const String switchOnYourDevice =
//       "1-Press device's reset switch for 10 seconds.";
//   static const String waitForQRCode = "2-Wait for the QR screen to be shown!";
//   static const String giveAppCameraPermission =
//       "3-Give App the permission to use the camera and\n   scan the QR code shown in the device's display!";
//   static const String scanDevice = "Scan Device";
//   static const String skipInstallation = "Skip Install";
//   static const String addDevice = "Add Device";
//   static const String userSettings = "Settings";
//   static const String wifiCredentials = "WiFi Credentials";
//   static const String sendWiFiCredentials = "Send WiFi Credentials";
//   static const String saveData = "Save Data";
//   static const String confirmSettings = "Confirm Settings";
//   static const String confirm = "Confirm";
//   static const String deviceName = "Device Name";
//   static const String deviceCityName = "City Name";
//   static const String notifications = "Notifications";
//   static const String ssid = "SSID";
//   static const String wifiPsk = "Password";
//   static const String wifiName = "WiFi Name";
//   static const String invalidWiFi = "Invalid WiFi Name";
//   static const String deviceInstallations = "Device Installation Settings";
//   static const String deviceInstallInstructions =
//       "please provide your WiFi credentials\n"
//       "and your device preferred settings!";
//   static const String galleryPick = "Pick from Gallery";
//   static const String cameraPick = "Take a Photo";

//   static const List<String> deviceDataUnit = ["Metric", "Imperial"];
//   static const String userDevices = "Your Frames";
//   static const String updateTime = "Show Time";
//   static const String devicePlaylist = "playlist";
//   static const String deviceCurrentImg = "Live Now";
//   static const String calendarWeatherContent = "Calender & Weather";
//   static const String designerTool = "Designer Tool";
//   static const String selectFontAndColor = "Font Settings";
//   static const String selectContentType = "Select Content Type";
//   static const String myMedia = "My Media";
//   static const String cloudMedia = "Cloud Media";
//   static const String contentDeleted = "Content deleted!";
//   static const String confirmDelete = "Are you sure you want to delete ?";
//   static const String frameSettings = "Adjust Frame Settings";
//   static const String cancel = "Cancel";
//   static const String settings = "Settings";
//   static const String delete = "Delete";
//   static const String deleteContent = "Are you sure you want to delete?";
//   static const String deleteFrame = "Are you sure you want to delete frame?";
//   static const String deleted = 'deleted';
//   static const String deleteFailed = "delete failed";
//   static const String contentInUse = "The content in use!";
//   static const String logout = "Log out";
//   static const String failed = "Failed";
//   static const String accountCreationTime = "Created At";
//   static const String noNotifications = "No Notifications to show";
//   static const String success = "Success";
//   static const String yourDesign = "Your Design";
//   static const String registerSuccess = "Register Success";
//   static const String resetPasswordSuccess = "Reset password Success";
//   static const String registerSuccess2 = "Your account have been created!";
//   static const String acceptPolicy1 =
//       "By tapping the checkbox, you are indicating that you sign up and have read and accepted all of our ";
//   static const String termsAndConditions = 'Terms & Conditions';
//   static const String and = ' and ';
//   static const String privacyPolicy = 'privacy policy';
//   static const String acceptPolicy2 = ' to successfully complete registration.';
//   static const String deviceActiveTime = 'Device active every Min(s).';
//   static const String selectActiveTime = "Select time in minutes";
//   static const String fontName = "Font name";
//   static const String fontColor = "Font color";
//   static const String black = "Black";
//   static const String white = "White";
//   static const String red = "Red";
//   static const String save = "Save";
//   static const String advancedSettings = "Advanced Settings";
//   static const String advancedSettingsDetail =
//       "defaulted to your system timezone, change to your preference";
//   static const String exitApp = 'Exit App';
//   static const String sureExitApp = 'Are you sure exiting the app';
//   static const String leave = "leave";
//   static const String enterImageUrl = "Enter Image URL:";
//   static const String onlyURL = "Enter Image URL";
//   static const String enterTextQr = "Enter Text to be QR code:";
//   static const String onlyQr = "Enter Text here:";
//   static const String savedToCloudMedia = "saved to your cloud media!";
//   static const String errorHappend = "Error happened!";
// }
