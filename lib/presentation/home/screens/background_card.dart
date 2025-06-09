
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/constants.dart';
import '../../widget/custom_button.dart';

class BackgroundImage extends StatelessWidget {
  const BackgroundImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final Size displaysize = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: displaysize.width * 1.63,
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover, image: NetworkImage(mainImage))),
        ),
        Positioned(
          bottom: -4,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const CustomButtonWidget(icon: Icons.add, title: 'My List'),
              _PlayButtomWidget(),
              const CustomButtonWidget(icon: Icons.info_outlined, title: 'Info')
            ],
          ),
        )
      ],
    );
  }
}



class _PlayButtomWidget extends StatelessWidget {
  const _PlayButtomWidget();

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: () {},
      icon: Icon(
        Icons.play_arrow,
        color: Colors.black,
        size: 30,
      ),
      label: Padding(
        padding: const EdgeInsets.only(right: 9.0),
        child: Text(
          "Play",
          style: GoogleFonts.roboto(
            color: Colors.black,
            fontWeight: FontWeight.w700,
            fontSize: 20,
          ),
        ),
      ),
      style: ButtonStyle(
        // ignore: deprecated_member_use
        backgroundColor: WidgetStateProperty.all(Colors.white.withOpacity(0.9)),
        padding: WidgetStateProperty.all(
          EdgeInsets.symmetric(horizontal: 6, vertical: 0),
        ),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
      ),
    );
  }
}
