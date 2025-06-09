import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bordered_text/bordered_text.dart';
import '../../../core/colors/colors.dart';
import '../../../core/constants/constants.dart';
class NumberCardWidget extends StatelessWidget {
  final int index;
  final AsyncSnapshot snapshot;
  const NumberCardWidget({super.key,required this.index,required this.snapshot});

  @override
  Widget build(BuildContext context) {
    final Size displaysize = MediaQuery.of(context).size;
    return Stack(
      children: [
        Row(
          children: [
            SizedBox(height: 160, width: displaysize.width*0.08,),
            Container(
              width: displaysize.width*0.32,
              height: 160,
              decoration: BoxDecoration(
                  borderRadius: kRadius9,
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                        '${Constants.imagePath}${snapshot.data[index].poseterPath}',
                      ))
              ),
            ),
          ],
        ),

        Positioned(
            left: -10,
            bottom: -15,
            child: BorderedText(
                strokeColor: white,
                strokeWidth: 2.0,
                child: Text("${index+1}",style: GoogleFonts.roboto(fontSize: 115, decoration: TextDecoration.none, color: Colors.transparent,fontWeight: FontWeight.bold, )))),
      ],
    );
  }
}