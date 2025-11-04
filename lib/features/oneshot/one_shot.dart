
// import 'package:flutter/material.dart';
// import 'package:momo/features/oneshot/controller/oneshot_controller.dart';

// class OneShot extends StatefulWidget {
//   const OneShot({super.key});

//   @override
//   State<OneShot> createState() => _OneShotState();
// }

// class _OneShotState extends State<OneShot> {
//   // @override
//   // bool get wantKeepAlive => true;

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       // final cOneShot = context.read<COneShot>();
//       // cOneShot.setOneshotList([]);
//     });
//   }

//   @override
//   void dispose() {
//     print("dispose");
//     // TODO: implement dispose
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     COneShot cOneShot = context.watch<COneShot>();

//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: Stack(
//         children: [
//           SingleChildScrollView(
//             child: Column(
//               children: [
//                 TopSlider(
//                   oneShotItemList:cOneShot.oneShotList.isNotEmpty? cOneShot.oneShotList[0].items
//                       .map((item) => OSItemModel.fromMap(item))
//                       .toList() : [],
//                   isExplore: false,
//                   onTap: (osItem) {
//                     SvNavigator().onseShotToApply(osItem: osItem);
//                   },
//                 ),

//                 // OneShot list
//                 ListView.builder(
//                   physics: NeverScrollableScrollPhysics(),
//                   itemCount: cOneShot.oneShotList.length,
//                   shrinkWrap: true,
//                   itemBuilder: (_, index) {
//                     return getOneShotList(
//                       context,
//                       oneShot: cOneShot.oneShotList[index],
//                     );
//                   },
//                 ),
//               ],
//             ),
//           ),

//           // the top label of pro
//           proLabel(),
//         ],
//       ),
//     );
//   }
// }
