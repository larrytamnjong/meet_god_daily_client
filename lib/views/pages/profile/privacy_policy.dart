import 'package:flutter/material.dart';
import 'package:meet_god_daily_client/views/widgets/styles/text_styles.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppBarTitle(
          title: "Privacy policy",
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Term(
                text:
                    'By using the Meeting God Daily app, you agree to the following terms and conditions:',
              ),
              Term(
                text:
                    'Acceptance of Terms: By downloading, installing, or using the Meeting God Daily app ("the App"), you agree to comply with and be bound by the following terms and conditions.',
              ),
              Term(
                text:
                    'User Registration: Users are required to register with a valid name, phone number, email address, and password to access the full features of the App. Users must provide accurate and up-to-date information during the registration process.',
              ),
              Term(
                text:
                    'Subscription and Payments: Users may subscribe to Meeting God Daily through in-app purchases. Subscriptions are billed on a recurring basis, and the user agrees to pay the specified subscription fee. No refunds will be provided for any subscription fees paid.',
              ),
              Term(
                text:
                    'Account Security: Users are responsible for maintaining the confidentiality of their account information, including their password. Users agree to notify Meeting God Daily immediately of any unauthorized use of their account or any other breach of security.',
              ),
              Term(
                text:
                    'Content Ownership: All content provided through the App, including daily devotionals, text, images, and audio, is the property of Meeting God Daily or its licensors. Users may not reproduce, distribute, or create derivative works from the content without the express consent of Meeting God Daily.',
              ),
              Term(
                text:
                    'User Conduct: Users agree to use the App in accordance with applicable laws and regulations. Any use of the App for illegal or unauthorized purposes is strictly prohibited. Users shall not engage in any conduct that disrupts the normal functioning of the App or infringes upon the rights of others.',
              ),
              Term(
                text:
                    'Account Deletion: Users can request the deletion of their account by contacting the support team. Meeting God Daily reserves the right to retain certain user data as required by law or for legitimate business purposes, even after an account has been deleted.',
              ),
              Term(
                text:
                    'Contact Information: If you have any questions about these terms and conditions or wish to delete your account, please contact us at P.O. Box 1, Bamenda NWR, Cameroon',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Term extends StatelessWidget {
  final String text;
  const Term({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 3.0, bottom: 3.0),
      child: Text(
        text,
        style: mediumTextStyle.copyWith(fontSize: 15.0),
        textAlign: TextAlign.left,
      ),
    );
  }
}
