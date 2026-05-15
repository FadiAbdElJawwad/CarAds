class PrivacyPolicyModel {
  final String title;
  final String content;

  PrivacyPolicyModel({required this.title, required this.content});
}

List<PrivacyPolicyModel> privacyPolicyData = [
  PrivacyPolicyModel(
    title: '1. Information Collection and Use:',
    content:
        'We may collect certain personal information from you, such as your name, email address, and contact details when you sign up or use our services. This information is used to personalize your experience, improve our services, and communicate with you.',
  ),
  PrivacyPolicyModel(
    title: '2. Log Data:',
    content:
        'When you use our app, we may collect information that your mobile device sends, such as your device ID, IP address, device name, and operating system version. This data is used for app performance analysis and to enhance user experience.',
  ),
  PrivacyPolicyModel(
    title: '3. Cookies and Similar Technologies:',
    content:
        'We may use cookies and similar tracking technologies to track the activity on our application and hold certain information. You can instruct your browser to refuse all cookies or to indicate when a cookie is being sent.',
  ),
  PrivacyPolicyModel(
    title: '4. Service Providers:',
    content:
        'We may employ third-party companies and individuals to facilitate our services, perform service-related tasks, or assist us in analyzing how our application is used. These third parties have access to your personal information only to perform these tasks on our behalf.',
  ),
  PrivacyPolicyModel(
    title: '5. Security:',
    content:
        'The security of your personal information is important to us. We strive to use commercially acceptable means to protect your personal information, but please remember that no method of transmission over the internet or electronic storage is 100% secure.',
  ),
  PrivacyPolicyModel(
    title: '6. Links to Other Sites:',
    content:
        'Our application may contain links to other sites that are not operated by us. If you click on a third-party link, you will be directed to that third party\'s site. We strongly advise you to review the Privacy Policy of every site you visit.',
  ),
  PrivacyPolicyModel(
    title: '7. Changes to This Privacy Policy:',
    content:
        'We may update our Privacy Policy from time to time. We will notify you of any changes by posting the new Privacy Policy on this page. You are advised to review this Privacy Policy periodically for any changes.',
  ),
];
