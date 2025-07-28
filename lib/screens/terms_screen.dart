import 'package:flutter/material.dart';
import 'package:mipuiaw_apps/reusables/colors.dart';
import 'package:mipuiaw_apps/reusables/reusables.dart';

class TermsScreen extends StatelessWidget {
  const TermsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColor.limeGreen,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '🔹 Terms of Use',
                style: termsHeadingStyle(),
              ),
              sizedBoxHeight(10),
              const Text(
                  'Welcome to Mipui Aw! By downloading, installing, or using our mobile application, you agree to the following terms. Please read them carefully.'),
              sizedBoxHeight(10),
              Text(
                '1. Acceptance of Terms',
                style: termsHeadingStyle(),
              ),
              sizedBoxHeight(10),
              const Text(
                  'By registering and logging into Mipui Aw, you acknowledge that you have read, understood, and agree to be bound by these Terms of Use and our Privacy Policy.'),
              sizedBoxHeight(10),
              Text(
                '2. User Registration',
                style: termsHeadingStyle(),
              ),
              sizedBoxHeight(10),
              const Text(
                  'Users must provide accurate and complete information during registration.'),
              const Text(
                  'You are responsible for maintaining the confidentiality of your login credentials.'),
              const Text(
                  'You agree not to share your account or allow others to access your account.'),
              sizedBoxHeight(10),
              Text(
                '3. User Guidelines',
                style: termsHeadingStyle(),
              ),
              sizedBoxHeight(10),
              const Text(
                  'You agree to use Mipui Aw only for lawful purposes. You must not:'),
              const Text(
                  'Attempt to gain unauthorized access to other users’ accounts.'),
              const Text('Upload or distribute harmful or offensive content.'),
              const Text('Interfere with the app’s performance or security.'),
              sizedBoxHeight(10),
              Text(
                '4. Termination',
                style: termsHeadingStyle(),
              ),
              sizedBoxHeight(10),
              const Text(
                  'Mipui Aw reserves the right to suspend or terminate your account at any time, with or without notice, if you violate these terms.'),
              sizedBoxHeight(10),
              Text(
                '5. Modifications to the App',
                style: termsHeadingStyle(),
              ),
              sizedBoxHeight(10),
              const Text(
                  'We reserve the right to update or modify the app at any time without notice. Your continued use of the app signifies your acceptance of any updates.'),
              sizedBoxHeight(10),
              Text(
                '🔹 Privacy Policy',
                style: termsHeadingStyle(),
              ),
              sizedBoxHeight(10),
              const Text(
                  'Your privacy is important to us. This section explains how we collect, use, and protect your data.'),
              sizedBoxHeight(10),
              Text(
                '1. Data Collection',
                style: termsHeadingStyle(),
              ),
              sizedBoxHeight(10),
              const Text(
                  'When you register or log in to Mipui Aw, we may collect the following:'),
              const Text('Personal information (name, email, phone number).'),
              const Text('Login credentials.'),
              sizedBoxHeight(10),
              Text(
                '2. How We Use Your Information',
                style: termsHeadingStyle(),
              ),
              sizedBoxHeight(10),
              const Text('We use your information to:'),
              const Text('Create and manage your user account'),
              const Text('Provide personalized content and features'),
              const Text('Communicate with you about the app'),
              const Text('Improve our services and user experience'),
              sizedBoxHeight(10),
              Text(
                '3. Data Security',
                style: termsHeadingStyle(),
              ),
              sizedBoxHeight(10),
              const Text(
                  'We implement reasonable security measures to protect your data from unauthorized access, loss, or misuse. However, no method of transmission over the internet or electronic storage is 100% secure.'),
              sizedBoxHeight(10),
              Text(
                '4. Your Rights',
                style: termsHeadingStyle(),
              ),
              sizedBoxHeight(10),
              const Text(
                  'You have the right to access, correct, or delete your personal information. You can do this by contacting us through the app or our support channels.'),
              sizedBoxHeight(10),
              Text(
                '5. Changes to the Privacy Policy',
                style: termsHeadingStyle(),
              ),
              sizedBoxHeight(10),
              const Text(
                  'We may update this Privacy Policy from time to time. We will notify you of any significant changes through the app or by email. Your continued use of Mipui Aw after such changes constitutes your acceptance of the updated policy.'),
            ],
          ),
        ),
      ),
    );
  }
}
