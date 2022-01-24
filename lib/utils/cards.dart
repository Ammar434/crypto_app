class Card3d {
  final String title;
  final String price;
  final String image;
  final String achatPropFirm;
  final String certification;
  final String croissance;
  final String rendement;
  final String gratuiteAcademy;
  final String coutMensuel;
  final String gain;

  const Card3d(
      this.price,
      this.image,
      this.title,
      this.achatPropFirm,
      this.certification,
      this.croissance,
      this.rendement,
      this.gratuiteAcademy,
      this.coutMensuel,
      this.gain);
}

const _path = 'assets/images/home';

final cardList = [
  const Card3d("2000", "$_path/double_black.jpg", "Double Black", "200", "14",
      "30", "7079", "90", "600", "300"),
  const Card3d("1250", "$_path/diamond.jpg", "Diamond", "100", "14", "30",
      "3539", "1769", "884", "353"),
  const Card3d("1000", "$_path/gold.jpg", "Gold", "50", "14", "30", "1769",
      "45", "400", "150"),
  const Card3d("850", "$_path/silver.jpg", "Silver", "25", "14", "30", "884",
      "30", "350", "100"),
  const Card3d("555", "$_path/basic.jpg", "Basic", "10", "14", "30", "353",
      "14", "200", "50"),
];
