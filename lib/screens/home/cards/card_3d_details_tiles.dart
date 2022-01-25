import 'package:crypto_app/utils/cards.dart';
import 'package:crypto_app/utils/colors.dart';
import 'package:flutter/material.dart';

class Card3DDetailsTiles extends StatelessWidget {
  const Card3DDetailsTiles({
    Key? key,
    required this.size,
    required this.starSize,
    required this.card,
  }) : super(key: key);

  final Size size;
  final double starSize;
  final Card3d card;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width / 20),
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Icon(
                  Icons.star,
                  color: thirdColor,
                  size: starSize,
                ),
                const Text(
                  "Academy 30 Jours - ",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: primaryColor),
                ),
                const Text(
                  "Requis",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black),
                ),
              ],
            ),
          ),
          Card3dDetailTileWidget(
            starSize: starSize,
            card: card,
            size: size,
            text: "Achat Prop Firm - ",
            optionalText:
                "Remboursement du compte par le broker au premier retrait : valeur sur le site du broker choisi",
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Icon(
                  Icons.star,
                  color: thirdColor,
                  size: starSize,
                ),
                const Text(
                  "Certification - ",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: primaryColor),
                ),
                Text(
                  "${card.certification} Jours",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Icon(
                  Icons.star,
                  color: thirdColor,
                  size: starSize,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Text(
                          "Croissance 5% - ",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: primaryColor),
                        ),
                        Text(
                          "${card.croissance} Jours",
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.black),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: size.width / 1.3,
                      child: Text(
                        "Croissance garantie - Objectif Mensuel 6,5%",
                        maxLines: 3,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black54,
                            fontSize: size.height / 60),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Icon(
                  Icons.star,
                  color: thirdColor,
                  size: starSize,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Text(
                          "RENDEMENT PREVU - ",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: primaryColor),
                        ),
                        Text(
                          "${card.rendement} €",
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.black),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: size.width / 1.3,
                      child: Text(
                        "Montant après déduction de la comission du broker",
                        maxLines: 3,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black54,
                            fontSize: size.height / 60),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Icon(
                  Icons.star,
                  color: thirdColor,
                  size: starSize,
                ),
                const Text(
                  "Gratuite Academy - ",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: primaryColor),
                ),
                Text(
                  "${card.gratuiteAcademy} Jours",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Icon(
                  Icons.star,
                  color: thirdColor,
                  size: starSize,
                ),
                const Text(
                  "Cout Mensuel - ",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: primaryColor),
                ),
                Text(
                  "${card.coutMensuel} €",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Icon(
                  Icons.star,
                  color: thirdColor,
                  size: starSize,
                ),
                const Text(
                  "Gain - ",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: primaryColor),
                ),
                Text(
                  "${card.gain} €",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Card3dDetailTileWidget extends StatelessWidget {
  const Card3dDetailTileWidget({
    Key? key,
    required this.starSize,
    required this.card,
    required this.size,
    required this.text,
    this.optionalText = "",
  }) : super(key: key);

  final double starSize;
  final Card3d card;
  final Size size;
  final String text;
  final String optionalText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Icon(
            Icons.star,
            color: thirdColor,
            size: starSize,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    text,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, color: primaryColor),
                  ),
                  Text(
                    "${card.achatPropFirm}K",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                ],
              ),
              SizedBox(
                width: size.width / 1.3,
                child: Text(
                  optionalText,
                  maxLines: 3,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black54,
                      fontSize: size.height / 60),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
