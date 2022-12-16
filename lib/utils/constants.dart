import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

enum SocialMedia {
  linkedIn(FontAwesomeIcons.linkedin),
  twitter(FontAwesomeIcons.twitter),
  github(FontAwesomeIcons.github),
  instagram(FontAwesomeIcons.instagram);

  final IconData icon;
  const SocialMedia(this.icon);
}

enum TaskStatus {
  todo(Icons.assignment, Colors.pink),
  progress(Icons.incomplete_circle, Colors.amber),
  done(Icons.done, Colors.green),
  favorite(Icons.favorite, Colors.red);

  final IconData icon;
  final Color color;
  const TaskStatus(this.icon, this.color);
}

TextStyle kTextStyleGrey(double size) {
  return GoogleFonts.arimaMadurai(
    textStyle: TextStyle(fontSize: size, color: Colors.grey),
  );
}

TextStyle kTextStyleWhite(double size) {
  return GoogleFonts.arimaMadurai(
    textStyle: TextStyle(fontSize: size, color: Colors.white),
  );
}

TextStyle kTextStyleBlack(double size) {
  return GoogleFonts.arimaMadurai(
    textStyle: TextStyle(
      fontSize: size,
      color: Colors.black,
    ),
  );
}

TextStyle kTextStyleBoldGrey(double size) {
  return GoogleFonts.arimaMadurai(
    textStyle: TextStyle(
      fontSize: size,
      color: Colors.grey,
      fontWeight: FontWeight.bold,
    ),
  );
}

TextStyle kTextStyleBoldBlack(double size) {
  return GoogleFonts.arimaMadurai(
    textStyle: TextStyle(
      fontSize: size,
      color: Colors.black,
      fontWeight: FontWeight.bold,
    ),
  );
}

TextStyle kTextStyleBoldAmber(double size) {
  return GoogleFonts.arimaMadurai(
    textStyle: TextStyle(
      fontSize: size,
      color: Colors.amber,
      fontWeight: FontWeight.bold,
    ),
  );
}

TextStyle kTextStyleBoldWhite(double size) {
  return GoogleFonts.arimaMadurai(
    textStyle: TextStyle(
      fontSize: size,
      color: Colors.white,
      fontWeight: FontWeight.bold,
    ),
  );
}

Widget kVerticalSpace(double height) => SizedBox(height: height);

const List<Color> colors = [
  Colors.pink,
  Colors.purple,
  Colors.amber,
  Colors.orange,
  Colors.teal,
  Colors.green,
  Colors.blue,
  Colors.blueGrey,
];

String showGreeting() {
  var hour = DateTime.now().hour;
  if (hour < 12) {
    return 'Good Morning';
  } else if (hour < 18) {
    return 'Good Afternoon';
  } else if (hour < 5) {
    return 'Good Night';
  } else if (hour > 17 && hour < 24) {
    return 'Good Evening';
  }
  return 'Good Night';
}

String formattingTimeOfDay(TimeOfDay timeOfDay) {
  final now = DateTime.now();
  final date = DateTime(
    now.year,
    now.month,
    now.day,
    timeOfDay.hour,
    timeOfDay.minute,
  );
  final format = DateFormat.jm();
  return format.format(date);
}
