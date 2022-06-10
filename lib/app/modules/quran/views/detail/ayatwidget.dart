import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:muslim_app/app/models/ayat.dart';
import 'package:muslim_app/theme.dart';

class AyatWidget extends StatelessWidget {
  final AyatElement ayat;
  final bool isCurrentIndex;
  AyatWidget(this.ayat, this.isCurrentIndex);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: isCurrentIndex ? greenColor.withOpacity(0.05) : Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 14),
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(18),
              decoration: BoxDecoration(
                  border: Border.all(color: cyanColor, width: 1.5),
                  color: cyanColor.withOpacity(0.12),
                  borderRadius: BorderRadius.circular(18)),
              child: Text(
                ayat.ar,
                textAlign: TextAlign.right,
                style: lightTextStyle.copyWith(fontSize: 18),
              ),
            ),
            SizedBox(height: 14),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 14),
              child: HtmlWidget(
                "${ayat.nomor}.  ${ayat.tr}",
                customStylesBuilder: (element) {
                  Map<String, String> style = {};
                  if (element.localName == 'strong') {
                    style['color'] = 'blue';
                  }
                  if (element.localName == 'u') {
                    style['color'] = 'green';
                  }
                  return style;
                },
                textStyle: mediumTextStyle.copyWith(fontSize: 14),
              ),
            ),
            SizedBox(height: 14),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 14),
              child:
                  Text(ayat.idn, style: lightTextStyle.copyWith(fontSize: 14)),
            ),
          ],
        ),
      ),
    );
  }
}
