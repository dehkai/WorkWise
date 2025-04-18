import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workwise/Controller/ForgotPasswordController.dart';
import '../../../core/app_export.dart';
import '../../../theme/custom_button_style.dart';
import '../../../widgets/app_bar/appbar_leading_image.dart';
import '../../../widgets/app_bar/custom_app_bar.dart';
import '../../../widgets/custom_elevated_button.dart';
import '../../../widgets/custom_text_form_field.dart'; // ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class ForgotPasswordOneScreen extends StatelessWidget {
  ForgotPasswordOneScreen({Key? key})
      : super(
          key: key,
        );

  TextEditingController emailController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgotPasswordController());
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: _buildAppBar(context),
        body: SingleChildScrollView(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Container(
              width: double.maxFinite,
              padding: EdgeInsets.symmetric(
                horizontal: 17.h,
                vertical: 12.v,
              ),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 18.h),
                      child: Text(
                        "Forgot Password",
                        style: theme.textTheme.headlineLarge,
                      ),
                    ),
                  ),
                  SizedBox(height: 10.v),
                  Container(
                    width: 301.h,
                    margin: EdgeInsets.only(
                      left: 18.h,
                      right: 21.h,
                    ),
                    child: Text(
                      "Please enter your registered email. An reset password link will be sent to you email",
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: CustomTextStyles.bodyLargeGray700.copyWith(
                        height: 1.50,
                      ),
                    ),
                  ),
                  SizedBox(height: 19.v),
                  Padding(
                    padding: EdgeInsets.only(left: 6.h),
                    child: FutureBuilder<String?>(
                      future: _validateEmail(controller),
                      builder: (context, snapshot) {
                        return Form(
                          key: controller.ForgotPasswordFormKey,
                          child: CustomTextFormField(
                            controller: controller.email,
                            hintText: "Email Address",
                            textInputAction: TextInputAction.done,
                            textInputType: TextInputType.emailAddress,
                            prefix: Container(
                              margin:
                                  EdgeInsets.fromLTRB(20.h, 15.v, 10.h, 15.v),
                              child: CustomImageView(
                                imagePath: ImageConstant.imgMessage,
                                height: 24.adaptSize,
                                width: 24.adaptSize,
                              ),
                            ),
                            prefixConstraints: BoxConstraints(
                              maxHeight: 54.v,
                            ),
                            contentPadding: EdgeInsets.only(
                              top: 15.v,
                              right: 30.h,
                              bottom: 15.v,
                            ),
                            borderDecoration:
                                TextFormFieldStyleHelper.fillWhiteATL12,
                            textStyle: TextStyle(color: Colors.black),
                            validator: (value) {
                              return snapshot.data;
                            },
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 34.v),
                  CustomElevatedButton(
                    height: 54.v,
                    text: "CONTINUE",
                    margin: EdgeInsets.only(left: 6.h),
                    buttonStyle: CustomButtonStyles.fillPrimaryTL12,
                    buttonTextStyle: CustomTextStyles.titleMediumWhiteA700,
                    onPressed: () => controller.sendPasswordResetEmail(context),
                  ),
                  SizedBox(height: 5.v)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      leadingWidth: double.maxFinite,
      leading: AppbarLeadingImage(
        imagePath: ImageConstant.imgArrowLeft,
        margin: EdgeInsets.fromLTRB(30.h, 17.v, 335.h, 17.v),
        onTap: () {
          onTapArrowleftone(context);
        },
      ),
    );
  }

  /// Navigates back to the previous screen.
  onTapArrowleftone(BuildContext context) {
    Navigator.pop(context);
  }

  Future<String?> _validateEmail(ForgotPasswordController controller) async {
    String? value = controller.email.text;
    if (value == null || value.isEmpty) {
      return 'Email is required';
    } else if (!GetUtils.isEmail(value)) {
      return 'Enter a valid email';
    } else {
      // Perform the asynchronous check if the email is registered
      bool isRegistered = await controller.isEmailRegistered(value);
      if (!isRegistered) {
        return 'Email is not registered';
      }
    }
    return null; // Return null if validation succeeds
  }
}
