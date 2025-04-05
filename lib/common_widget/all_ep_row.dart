import 'package:flutter/material.dart';
import '../common/color_extention.dart';

class AllEpRow extends StatelessWidget {
  final Map sObj;
  final VoidCallback onPressedPlay;
  final VoidCallback onPressed;
  const AllEpRow({
    super.key,
    required this.sObj,
    required this.onPressed,
    required this.onPressedPlay,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [

            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), // Rayon de bordure de 10 pixels
              ),
              clipBehavior: Clip.hardEdge, // Assure que l'image respecte les limites du rayon de bordure
              child: Image.asset(
                sObj["image"],
                fit: BoxFit.cover, // Assure que l'image couvre entièrement le conteneur
              ),
            ),

            const SizedBox(width: 14),

            Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      sObj["nameEp"],
                      maxLines: 1,
                      style: TextStyle(
                          color: TColor.primaryText60,
                          fontSize: 13,
                          fontWeight: FontWeight.w700),
                    ),
                    Text(
                      sObj["artists"],
                      maxLines: 1,
                      style: TextStyle(color: TColor.primaryText28, fontSize: 10),
                    ),

                    SizedBox(height: 5),

                    Row(
                      children: [
                        Text(
                          sObj["nombreMorceau"],
                          maxLines: 1,
                          style: TextStyle(
                              color: TColor.primaryText60,
                              fontSize: 10,
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(width: 5),
                        Text(
                          "Morceaux",
                          style: TextStyle(
                              color: TColor.primaryText60,
                              fontSize: 10,
                              fontWeight: FontWeight.w500),
                        ),

                        SizedBox(width: 5),

                        Container(
                          width: 10,
                          height: 10,
                          decoration: BoxDecoration(
                              color: Colors.white10,
                              borderRadius: BorderRadius.circular(2)
                          ),
                          child: Center(
                            child: Text(
                              sObj["type"],
                              style: TextStyle(
                                fontSize: 7,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
            ),

            Icon(Icons.more_vert,
                size: 20,
                color: Color(0xFF31314F)
            ),
          ],
        ),
        Divider(
          color: Colors.white.withOpacity(0.07),
          indent: 50,
        ),
      ],
    );
  }
}
