
// import 'package:flutter/material.dart';
// import 'package:momo/core/asset_manager/assets/images.dart';
// import 'package:momo/core/util/constants/colors.dart';
// import 'package:momo/core/util/constants/text_style.dart';
// import 'package:momo/data/model/one_shot/oneshot_item_model.dart';
// import 'package:momo/core/util/services/sv_navigator_services.dart';

// Widget getOneShotItem({required OSItemModel osItem}){
//   return GestureDetector(
//     onTap: () {
//       // navigate to apply now page 
//       SvNavigator().onseShotToApply(osItem: osItem);
    
//     },
//     child: Stack(
//       children: [
//         Stack(
//           children: [
//             SizedBox(
//                       height: 200,
//                       width: 150,
//                       child: ClipRRect(
//                         borderRadius: BorderRadius.circular(20),
//                         child: Image.asset(
//                             Images.myPhoto, // Replace with your image path
//                             fit: BoxFit.cover,
//                           ),
//                       ),
//                     ),
//             Container(
//                       height: 200,
//                       width: 150,
                      
//                       decoration: BoxDecoration(
//                         gradient: MyColor.blackTransparentGradient,
//                         borderRadius: BorderRadius.circular(20),
//                       ),
//                     ),
    
//           ],
//         ),
    
//                 Positioned(
//                   bottom: 8,
//                   left: 0,
//                   right: 0,
//                   child: Column(
//                     children: [
//                       Text(osItem.title,textAlign: TextAlign.center, style: getTitleStyleS()),
    
//                     ],
//                   )),
//       ],
//     ),
//   );
// }