import 'package:flutter/material.dart';

import '';
import 'package:google_fonts/google_fonts.dart';

import '../colors/colors.dart';

const width = SizedBox(width: 14);
const kwidth8 = SizedBox(width: 8,);
const hight = SizedBox(height: 14,);
const hight35 = SizedBox(height: 35,);
const khight18 = SizedBox(height: 18,);
//* BorderRadius
final BorderRadius kRadius9 = BorderRadius.circular(9);
final BorderRadius kRadius30 = BorderRadius.circular(30);
//image
const mainImage = "https://th.bing.com/th/id/OIP.d0N-2AeBnvQttLOX-0x_jgHaLH?rs=1&pid=ImgDetMain";

const commingSoonImage = 'https://image.tmdb.org/t/p/original/jPL2LA8v36AETQXafaP8g6OhfVJ.jpg';

const everyonesImage = 'https://m.media-amazon.com/images/S/pv-target-images/83568dcbf0bd7aa663a10ec3f30926acfd6d2247fb766c49ee959820480aae2c._UR1920,1080_SX720_FMjpg_.jpg';

//TextStyle Home page
TextStyle kHomeTitleText = GoogleFonts.roboto(
  fontWeight: FontWeight.w500,
  color: white,
);

//Api key
class Constants {
  static const apiKey = "8298e9ee681622858e3bc8749a12f6e4";
  static const imagePath = "https://image.tmdb.org/t/p/w500";
}