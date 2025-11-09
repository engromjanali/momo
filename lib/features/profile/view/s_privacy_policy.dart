// import 'package:flutter/material.dart';
// import 'package:momo/core/util/constants/constants.dart';
// import 'package:momo/core/util/constants/text_style.dart';

// class MPPosicy {
//   String? title;
//   String? details;
//   MPPosicy({this.title, this.details});
// }

// List<MPPosicy> privacyPList = [
//   MPPosicy(
//     title: "1. Introduction",
//     details:
//         "Welcome to PhotoEdit ('App'), operated by PhotoEdit Inc. ('we,' 'us,' or 'our'). This Privacy Policy explains how we collect, use, disclose, and protect your personal information when you use our photo editing application. By using the App, you consent to the practices described in this policy. If you do not agree, please do not use the App.",
//   ),

//   MPPosicy(
//     title: "2. Information We Collect",
//     details:
//         "We collect the following types of information: (a) Personal Information: When you create an account, we may collect your name, email address, and profile information. (b) User Content: Photos, images, or other content you upload for editing may include metadata (e.g., location, date). (c) Device Information: We collect device type, operating system, IP address, and unique identifiers. (d) Usage Data: Information about how you interact with the App, such as features used and time spent. (e) Location Data: With your permission, we may collect your device’s location to enhance features like geotagging.",
//   ),
//   MPPosicy(
//     title: "3. How We Use Your Information",
//     details:
//         "We use your information to: (a) Provide and improve the App’s services, such as applying filters, saving edits, or enabling sharing. (b) Personalize your experience, such as suggesting filters based on usage. (c) Analyze usage patterns to enhance functionality and performance. (d) Communicate with you, including sending updates or responding to inquiries. (e) With your opt-in consent, use anonymized data from your photos to train AI models for improving editing features.",
//   ),
//   MPPosicy(
//     title: "4. How We Share Your Information",
//     details:
//         "We do not sell your personal information. We may share it with: (a) Service Providers: Third parties that help us operate the App (e.g., cloud storage, analytics providers) under strict confidentiality agreements. (b) Legal Requirements: If required by law, regulation, or legal process. (c) Business Transfers: In connection with a merger, acquisition, or sale of assets. User Content you share publicly (e.g., via social media integrations) may be visible to others.",
//   ),
//   MPPosicy(
//     title: "5. Data Security",
//     details:
//         "We implement reasonable security measures, such as encryption and access controls, to protect your personal information and User Content. However, no system is completely secure, and we cannot guarantee absolute security. You are responsible for maintaining the confidentiality of your account credentials.",
//   ),
//   MPPosicy(
//     title: "6. Data Retention",
//     details:
//         "We retain your personal information and User Content for as long as necessary to provide the App’s services or comply with legal obligations. You can delete your account or User Content at any time through the App’s settings. Deleted data may persist in backups for a reasonable period.",
//   ),
//   MPPosicy(
//     title: "7. Your Choices and Rights",
//     details:
//         "You may: (a) Access or update your account information in the App. (b) Opt out of location data collection via device settings. (c) Request deletion of your data by contacting us. (d) If you are in certain jurisdictions (e.g., EU, California), you may have additional rights, such as requesting a copy of your data or restricting processing. Contact us for details.",
//   ),
//   MPPosicy(
//     title: "8. Third-Party Services",
//     details:
//         "The App may integrate with third-party services (e.g., social media platforms for sharing photos). These services have their own privacy policies, and we are not responsible for their practices. Review their policies before sharing content through the App.",
//   ),
//   MPPosicy(
//     title: "9. Children’s Privacy",
//     details:
//         "The App is not intended for users under 13 years old (or 16 in certain jurisdictions). We do not knowingly collect personal information from children. If we learn that a child’s data has been collected, we will delete it promptly. Contact us if you believe we have collected such data.",
//   ),
//   MPPosicy(
//     title: "10. International Data Transfers",
//     details:
//         "Your information may be stored or processed in countries outside your jurisdiction, including the United States, where data protection laws may differ. We ensure appropriate safeguards are in place, such as standard contractual clauses, to protect your data.",
//   ),
//   MPPosicy(
//     title: "11. Changes to This Privacy Policy",
//     details:
//         "We may update this Privacy Policy from time to time. We will notify you of material changes by posting the updated policy in the App or via email. Your continued use of the App after the effective date constitutes your acceptance of the revised policy.",
//   ),
//   MPPosicy(
//     title: "12. Contact Us",
//     details:
//         "For questions or concerns about this Privacy Policy, contact us at: Email: support@photoeditapp.com; Address: PhotoEdit Inc., 123 Edit Lane, San Francisco, CA 94105, USA.",
//   ),
// ];

// class WPPolicy extends StatefulWidget {
//   const WPPolicy({super.key});

//   @override
//   State<WPPolicy> createState() => _WPPolicyState();
// }

// class _WPPolicyState extends State<WPPolicy> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       appBar: AppBar(
//         backgroundColor: Colors.black,
//         foregroundColor: Colors.white,
//         title: Text("Privacy & Posicy"),
//       ),
//       body: Column(
//         children: [
//           Row(
//             children: [
//               Expanded(
//                 child: Text(
//                   "MOMO",
//                   style: getSubtitleStyleL().copyWith(
//                     fontWeight: FontWeight.w800,
//                     fontSize: 26,
//                   ),
//                 ),
//               ),
//               Container(
//                 padding: EdgeInsets.all(10),
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(20),
//                 ),
//                 child: Row(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [Text("Try Momo"), Icon(Icons.star_half_sharp)],
//                 ),
//               ),
//             ],
//           ),
//           Divider(),

//           Expanded(
//             child: ListView.builder(
//               itemCount: privacyPList.length,
//               itemBuilder: (context, index) {
//                 if (privacyPList.length - 1 == index) {
//                   return getContact(title: "Contact Us");
//                 }
//                 return getPrivacyPolicy(
//                   title: privacyPList[index][Constants.title]!,
//                   details: privacyPList[index][Constants.details]!,
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }


// Widget getPrivacyPolicy({required String title, required String details}) {
//   return Column(
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: [
//       Text(title, style: conte.textTheme?.),
//       Text(
//         details,
//         style: getSubtitleStyleL().copyWith(
//           fontSize: 16,
//           fontWeight: FontWeight.normal,
//         ),
//       ),
//       SizedBox(height: 30),
//     ],
//   );
// }

// Widget getContact({required String title}) {
//   return Column(
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: [
//       Text(title, style: getTitleStyleL().copyWith(fontSize: 26)),
//       Text(
//         Constants.details,
//         style: getSubtitleStyleL().copyWith(
//           fontSize: 16,
//           fontWeight: FontWeight.normal,
//         ),
//       ),
//       SizedBox(height: 30),
//     ],
//   );
// }
