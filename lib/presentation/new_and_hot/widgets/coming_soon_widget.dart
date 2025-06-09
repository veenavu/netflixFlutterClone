import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/colors/colors.dart';
import '../../../core/constants/constants.dart';

import '../../widgets/custom_button_widget.dart';
import '../../widgets/video_widget.dart';

class CommingSoonWIdgetMain extends StatelessWidget {
  final AsyncSnapshot snapshot;
  final int index;
  const CommingSoonWIdgetMain({
    super.key, required this.snapshot, required this.index,

  });


  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        hight,
        Row(
          children: [
            SizedBox(
              width: 50,
              height: 460,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'FEB',
                    style:
                    TextStyle(color: avatarGray, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '${index + 1}',
                    style: TextStyle(
                        fontSize: 33,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 4),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: size.width - 60,
              height: 460,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  VideoShowWidget(imageUrl:'${Constants.imagePath}${snapshot.data[index].poseterPath}',),
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 50,
                          child: Text(
                            '${snapshot.data[index].originalName}',
                            style: GoogleFonts.atma(
                                fontSize: 36,
                                fontWeight: FontWeight.w500,
                                color: const Color.fromARGB(255, 194, 194, 194),
                                height: 2.3
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Row(
                          children: [
                            CustomButtonWidget(
                              icon: Icons.notifications_on_outlined,
                              title: 'Remind Me', iconSize: 17, textSize: 7,),
                            width,
                            CustomButtonWidget(
                              icon: Icons.info_outline_rounded, title: 'Info',textSize: 7,iconSize: 17,),
                            width,
                          ],
                        ),
                      )
                    ],
                  ),
                  Text('Comming on ${snapshot.data[index].relesedOn}'),
                  hight,
                  Image.network('https://vectorseek.com/wp-content/uploads/2023/10/Netflix-Films-Logo-Vector.png',height:30 ,width: 60,),hight,
                  Text('${snapshot.data[index].originalName}',style: GoogleFonts.lexend(fontWeight: FontWeight.w900,fontSize: 18,height: 1.7)
                    ,),hight,
                  Text('${snapshot.data[index].overview}',style: TextStyle(color: avatarGray),
                    overflow: TextOverflow.ellipsis,maxLines: 5,
                  )
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}