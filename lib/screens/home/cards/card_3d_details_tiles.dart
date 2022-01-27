import 'package:crypto_app/responsive/size_config.dart';
import 'package:crypto_app/utils/cards.dart';
import 'package:crypto_app/utils/colors.dart';
import 'package:flutter/material.dart';

import 'card_3d_detail_tile_widget.dart';

class Card3DDetailsTiles extends StatelessWidget {
  const Card3DDetailsTiles({
    Key? key,
    required this.card,
  }) : super(key: key);

  final Card3d card;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier * 5),
      child: ListView(
        children: [
          const Card3dDetailTileWidget(
            text1: "Academy 30 Jours - ",
            text2: "Requis",
          ),
          Card3dDetailTileWidget(
            text1: "Achat Prop Firm - ",
            text2: card.achatPropFirm,
            optionalText:
                "Remboursement du compte par le broker au premier retrait : valeur sur le site du broker choisi",
          ),
          Card3dDetailTileWidget(
              text1: "Certification - ", text2: "${card.certification} Jours"),
          Card3dDetailTileWidget(
            text1: "Croissance 5% - ",
            text2: "${card.croissance} Jours",
            optionalText: "Croissance garantie - Objectif Mensuel 6,5%",
          ),
          Card3dDetailTileWidget(
            text1: "RENDEMENT PREVU - ",
            text2: "${card.rendement} €",
            optionalText: "Montant après déduction de la comission du broker",
          ),
          Card3dDetailTileWidget(
            text1: "Gratuite Academy - ",
            text2: "${card.gratuiteAcademy} Jours",
          ),
          Card3dDetailTileWidget(
            text1: "Cout Mensuel - ",
            text2: "${card.coutMensuel} €",
          ),
          Card3dDetailTileWidget(
            text1: "Gain - ",
            text2: "${card.gain} €",
          ),
        ],
      ),
    );
  }
}
