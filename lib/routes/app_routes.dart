import 'package:flutter/material.dart';
import 'package:workwise/presentation/Client/candidate_profile.dart';
import 'package:workwise/presentation/Client/edit_post_client.dart';
import 'package:workwise/presentation/Client/success_post_client.dart';
import 'package:workwise/presentation/Freelancer/forgot_password_one_screen/forgot_password_one_screen.dart';
import 'package:workwise/presentation/Freelancer/forgot_password_two_screen/forgot_password_two_screen.dart';
import 'package:workwise/presentation/Freelancer/home_page/home_page.dart';
import '../presentation/Freelancer/home_page/home_container_screen.dart';
import '../presentation/Freelancer/applyjob/apply_job_page.dart';
import '../presentation/log_in_screen/log_in_screen.dart';
import '../presentation/Freelancer/sign_up_screen/sign_up_screen.dart';
import '../presentation/Freelancer/myjob_applications_container_screen/myjob_applications_container_screen.dart';
import '../presentation/Freelancer/myjob_applications_page/myjob_applications_page.dart';
import '../presentation/Freelancer/profile_screen/profile_screen.dart';
import '../presentation/Freelancer/search_tab_container_screen/search_tab_container_screen.dart';
import '../presentation/Freelancer/settings_screen/settings_screen.dart';
import '../presentation/Freelancer/change_password_screen/change_password_screen.dart';
import '../presentation/Freelancer/sign_up_verification_screen/sign_up_verification_screen.dart';
import '../presentation/Freelancer/check_session.dart';
import '../presentation/Freelancer/notification_screen/notification.dart';
import '../presentation/Freelancer/notification_detail_screen/notification_detail.dart';

// Client import
import '../presentation/Client/home_client_container_screen/home_client_container_screen.dart';
import '../presentation/Client/post_list_page/post_list_page.dart';
import 'package:workwise/presentation/Client/new_post_client.dart';
import '../presentation/Client/home_client_page/home_client_page.dart';
import '../presentation/loading_screen/loading_screen.dart';
import '../presentation/Client/client_profile_screen/client_profile_screen.dart';

import '../presentation/Client/candidate_page/candidate_page.dart';
import '../presentation/Client/client_settings_screen/client_settings_screen.dart';

class AppRoutes {
  //Client Routes
  static const String homeClientContainerScreen = '/home_client_container_screen';

  static const String homeClientPage = '/home_client_page';

  static const String postListPage = '/post_list_page';

  static const String candidatePage = '/candidate_page';

  static const String newPostPage = '/preview_post_screen';

  static const String editPostPage = '/edit_post_screen';

  static const String newPostClientScreen = '/new_post_client_screen';

  static const String successPostClientScreen = '/success_post_client_screen';
  static const String viewEmployeeProfileScreen = '/view_employee_profile_screen';

  //Freelancer Routes
  static const String changePasswordScreen = '/change_password_screen';

  static const String signUpVerificationScreen = '/sign_up_verification_screen';

  static const String logInScreen = '/log_in_screen';

  static const String signUpScreen = '/sign_up_screen';

  static const String selectJobCategoryScreen = '/select_job_category_screen';

  static const String selectJobPreferenceScreen = '/select_job_preference_screen';

  static const String homeContainerScreen = '/home_container_screen';

  static const String homePage = '/home_page';

  static const String appNavigationScreen = '/app_navigation_screen';

  static const String searchPage = '/search_page';

  static const String searchTabContainerScreen = '/search_tab_container_screen';

  static const String settingsScreen = '/settings_screen';

  static const String profileScreen = '/profile_screen';

  static const String myjobApplicationsContainerScreen = '/myjob_applications_container_screen';

  static const String myjobApplicationsPage = '/myjob_applications_page';

  static const String initialRoute = '/initialRoute';

  static const String settingsContainerScreen = '/settings_container_screen';

  static const String forgotPasswordOneScreen = '/forgot_password_one_screen';

  static const String forgotPasswordTwoScreen = '/forgot_password_two_screen';

  static const String checkSession = '/check_session';

  static const String notificationScreen = '/notification_screen';

  static const String notificationDetailScreen = '/notification_detail_screen';

  static const String applyJobScreen = '/apply_job_page';

  static const String loadingScreen = '/loading_screen';

  static const String clientProfileScreen = '/client_profile_screen';

  static const String insightJobScreen = '/insight_job_page';

  static const String clientSettingsScreen = '/client_settings_screen';

  static Map<String, WidgetBuilder> routes = {
    logInScreen: (context) => LogInScreen(),

    //Freelancer
    signUpScreen: (context) => SignUpScreen(),
    homeContainerScreen: (context) => HomeContainerScreen(),
    searchTabContainerScreen: (context) => SearchTabContainerScreen(),
    settingsScreen: (context) => SettingsScreen(),
    profileScreen: (context) => ProfileScreen(),
    myjobApplicationsContainerScreen: (context) => MyjobApplicationsContainerScreen(),
    myjobApplicationsPage: (context) => MyjobApplicationsPage(),
    homePage: (context) => HomePage(),
    changePasswordScreen: (context) => ChangePasswordScreen(),
    signUpVerificationScreen: (context) => SignUpVerificationScreen(),
    forgotPasswordOneScreen: (context) => ForgotPasswordOneScreen(),
    notificationScreen: (context) => NotificationScreen(),
    notificationDetailScreen: (context) => NotificationDetailScreen(),
    //Scrum 16 - Forgot Password: Pass email arguments from screen one to screen two for resend purpose
    forgotPasswordTwoScreen: (context) {
      final email = ModalRoute.of(context)?.settings.arguments as String?;
      return ForgotPasswordTwoScreen(email: email ?? '');
    },
    checkSession: (context) => CheckSession(),
    applyJobScreen: (context) => ApplyJobScreen(),
    loadingScreen: (context) => LoadingScreen(),

    //Client
    homeClientContainerScreen: (context) => HomeClientContainerScreen(),
    postListPage: (context) => PostListScreen(),
    candidatePage: (context) {
      final dynamic postDetail = ModalRoute.of(context)?.settings.arguments;
      return CandidateScreen(postDetail);
    },
    newPostPage: (context) => NewPostScreen(),
    editPostPage: (context) {
      final dynamic postDetail = ModalRoute.of(context)?.settings.arguments;
      return EditPostScreen(postDetail);
    },
    homeClientPage: (context) => HomeClientPage(),
    successPostClientScreen: (context) => SuccessPostClientScreen(),
    clientProfileScreen: (context) => ClientProfileScreen(),
    viewEmployeeProfileScreen: (context) {
      final dynamic candidateDetail = ModalRoute.of(context)?.settings.arguments;
      return CandidateProfile(candidateDetail);
    },
    clientSettingsScreen: (context) => ClientSettingsScreen(),

    // initialRoute: (context) => CheckSession()
    initialRoute: (context) => CheckSession()
  };
}
