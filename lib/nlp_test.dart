class ServiceNLP {
  Future nlp() async {
    var new_text = '';
    var kal_text = '';
    var cuaca = true;
    var gempa = true;
    var udara = true;
    var hujan = true;
    var polusi = true;

    var isMendung = 'mendung';
    var isHujan = 'hujan';
    var isGerimis = 'gerimis';
    var isAwan = 'awan';
    var isPanas = 'panas';
    var isDingin = 'dingin';
    var isGelap = 'gelap';
    var isTerang = 'terang';
    var isSejuk = 'sejuk';
    var isCuacanya = 'cuacanya';
    var isCuaca = 'cuaca'; // cuaca
    var isGetarannya = 'getaranya';
    var isGetaran = 'getaran';
    var isGempanya = 'gempanya';
    var isGempa = 'gempa'; // gempa
    var isPolusi = 'polusi';
    var isUdaranya = 'udaranya'; // udara
    var isUdara = 'udara';
    var isHari = 'hari ini';
    var isBesok = 'besok';
    var isSekarang = 'sekarang';

    var isKal0 = 'Halo BMKG, bagaimana cuaca hari ini?';
    new_text = isKal0.toLowerCase();
    cuaca = new_text.contains(isCuaca);
    hujan = new_text.contains(isHujan);
    gempa = new_text.contains(isGempa);
    udara = new_text.contains(isUdara);
    polusi = new_text.contains(isPolusi);

    if (cuaca) {
      print(isKal0 + "\n True - Cuaca \n");
    }
    if (gempa) {
      print(isKal0 + "\n True - Gempa \n");
    }
    if (udara) {
      print(isKal0 + "\n True - Udara \n");
    }
    if (hujan) {
      print(isKal0 + "\n True - Cuaca \n");
    }
    if (polusi) {
      print(isKal0 + "\n True - Udara \n");
    }
    var isKal1 = ' ( nama aplikasi ) ,  cuaca hari ini';
    new_text = isKal1.toLowerCase();
    cuaca = new_text.contains(isCuaca);
    hujan = new_text.contains(isHujan);
    gempa = new_text.contains(isGempa);
    udara = new_text.contains(isUdara);
    polusi = new_text.contains(isPolusi);

    if (cuaca) {
      print(isKal1 + "\n True - Cuaca \n");
    }
    if (gempa) {
      print(isKal1 + "\n True - Gempa \n");
    }
    if (udara) {
      print(isKal1 + "\n True - Udara \n");
    }
    if (hujan) {
      print(isKal1 + "\n True - Cuaca \n");
    }
    if (polusi) {
      print(isKal1 + "\n True - Udara \n");
    }

    var isKal2 = 'keadaan cuaca hari ini';
    new_text = isKal2.toLowerCase();
    cuaca = new_text.contains(isCuaca);
    hujan = new_text.contains(isHujan);
    gempa = new_text.contains(isGempa);
    udara = new_text.contains(isUdara);
    polusi = new_text.contains(isPolusi);

    if (cuaca) {
      print(isKal2 + "\n True - Cuaca \n");
    }
    if (gempa) {
      print(isKal2 + "\n True - Gempa \n");
    }
    if (udara) {
      print(isKal2 + "\n True - Udara \n");
    }
    if (hujan) {
      print(isKal2 + "\n True - Cuaca \n");
    }
    if (polusi) {
      print(isKal2 + "\n True - Udara \n");
    }
    var isKal3 = 'cuaca, hari ini bagaimana?';
    var isKal4 = 'cuaca hari ini. haruskah saya bawa payung';

    var isKal5 = 'Bagaimana cuaca hari ini? ';
    var isKal6 = 'Bagaimana cuaca hari ini?';
    var isKal7 = 'bagaimana cuaca hari ini';
    var isKal8 = 'Bagaimana cuaca hari ini? / Apakah hari ini akan hujan?';
    var isKal9 = 'Aplikasi, tolong tampilkan informasi cuaca hari ini dan esok';
    new_text = isKal9.toLowerCase();
    cuaca = new_text.contains(isCuaca);
    hujan = new_text.contains(isHujan);
    gempa = new_text.contains(isGempa);
    udara = new_text.contains(isUdara);
    polusi = new_text.contains(isPolusi);

    if (cuaca) {
      print(isKal9 + "\n True - Cuaca \n");
    }
    if (gempa) {
      print(isKal9 + "\n True - Gempa \n");
    }
    if (udara) {
      print(isKal9 + "\n True - Udara \n");
    }
    if (hujan) {
      print(isKal9 + "\n True - Cuaca \n");
    }
    if (polusi) {
      print(isKal9 + "\n True - Udara \n");
    }
    var isKal10 = 'Bagaimana cuaca hari ini di jakarta selatan';

    var isKal11 = 'cuaca hari ini';
    var isKal12 = 'Cek cuaca';

    var isKal13 = 'cuaca hari ini';

    var isKal14 = 'Cek info cuaca';
    var isKal15 = 'Cek informasi cuaca terkini';
    var isKal16 = 'Perkiraan cuaca hari ini';
    var isKal17 = 'Cuaca hari ini';
    var isKal18 = 'Bagaimana prakiraan cuaca hari ini';
    var isKal19 = 'Bagaimana cuaca hari ini di *sebutin wilayah';
    var isKal20 = 'Bagaimana cuaca hari ini di *sebutin wilayah';
    var isKal21 = 'Suhu ';
    var isKal22 = 'Weather';
    var isKal23 = 'Weather, please. ';
    var isKal24 = 'Suhu udara saat ini';
    var isKal25 = 'Cuaca BMKG';
    var isKal26 = 'Apakah hari ini cerah ?';
    var isKal27 = 'Halo BMKG, prakiraan cuaca hari ini';
    var isKal28 = 'Hujan gak?';
    var isKal29 = 'Hey bixby, info cuaca';
    var isKal30 = 'Info cuaca';
    var isKal31 = 'Prediksi Cuaca hari ini';
    var isKal32 = 'info cuaca dong';
    var isKal33 = 'Informasi cuaca sekarang';
    var isKal34 = 'Halo BMKG, informasi gema bumi terkini!';
    new_text = isKal34.toLowerCase();
    cuaca = new_text.contains(isCuaca);
    hujan = new_text.contains(isHujan);
    gempa = new_text.contains(isGempa);
    udara = new_text.contains(isUdara);
    polusi = new_text.contains(isPolusi);

    if (cuaca) {
      print(isKal34 + "\n True - Cuaca \n");
    }
    if (gempa) {
      print(isKal34 + "\n True - Gempa \n");
    }
    if (udara) {
      print(isKal34 + "\n True - Udara \n");
    }
    if (hujan) {
      print(isKal34 + "\n True - Cuaca \n");
    }
    if (polusi) {
      print(isKal34 + "\n True - Udara \n");
    }

    var isKal35 = '( nama aplikasi ) gempa hari ini';
    new_text = isKal35.toLowerCase();
    cuaca = new_text.contains(isCuaca);
    hujan = new_text.contains(isHujan);
    gempa = new_text.contains(isGempa);
    udara = new_text.contains(isUdara);
    polusi = new_text.contains(isPolusi);

    if (cuaca) {
      print(isKal35 + "\n True - Cuaca \n");
    }
    if (gempa) {
      print(isKal35 + "\n True - Gempa \n");
    }
    if (udara) {
      print(isKal35 + "\n True - Udara \n");
    }
    if (hujan) {
      print(isKal35 + "\n True - Cuaca \n");
    }
    if (polusi) {
      print(isKal35 + "\n True - Udara \n");
    }

    var isKal36 = 'aca, info gempa';

    new_text = isKal36.toLowerCase();
    cuaca = new_text.contains(isCuaca);
    hujan = new_text.contains(isHujan);
    gempa = new_text.contains(isGempa);
    udara = new_text.contains(isUdara);
    polusi = new_text.contains(isPolusi);

    if (cuaca) {
      print(isKal36 + "\n True - Cuaca \n");
    }
    if (gempa) {
      print(isKal36 + "\n True - Gempa \n");
    }
    if (udara) {
      print(isKal36 + "\n True - Udara \n");
    }
    if (hujan) {
      print(isKal36 + "\n True - Cuaca \n");
    }
    if (polusi) {
      print(isKal36 + "\n True - Udara \n");
    }

    var isKal37 = 'apa ada bahaya gempa merusak hari ini';
    var isKal38 = 'Apakah ada gempa bumi? ';
    var isKal39 = 'Apakah ada gempa yang akan datang?';
    var isKal40 = 'Apakah terjadi gempa? / Dimana dan kapan gempa terjadi?';
    new_text = isKal40.toLowerCase();
    cuaca = new_text.contains(isCuaca);
    hujan = new_text.contains(isHujan);
    gempa = new_text.contains(isGempa);
    udara = new_text.contains(isUdara);
    polusi = new_text.contains(isPolusi);

    if (cuaca) {
      print(isKal40 + "\n True - Cuaca \n");
    }
    if (gempa) {
      print(isKal40 + "\n True - Gempa \n");
    }
    if (udara) {
      print(isKal40 + "\n True - Udara \n");
    }
    if (hujan) {
      print(isKal40 + "\n True - Cuaca \n");
    }
    if (polusi) {
      print(isKal40 + "\n True - Udara \n");
    }

    var isKal41 = 'Aplikasi, tolong tampilkan informasi gempa bumi';
    var isKal42 = 'Bagaimana informasi gempa bumi di indonesia pada hari ini';
    var isKal43 = 'berita gempa hari ini';
    var isKal44 = 'Cek gempa';
    var isKal45 = 'Cek info gempa bumi';
    var isKal46 = 'Cek informasi gempa';
    var isKal47 = 'Dimana gempa barusan?';
    var isKal48 = 'Dimana gempa yang terjadi saat ini';
    var isKal49 = 'Earthquake ';
    var isKal50 = 'Gempa baru saja';
    var isKal51 = 'Gempa';
    var isKal52 = 'Gempa';
    var isKal53 = 'Gempa';
    var isKal54 = 'Gempa';
    var isKal55 = 'Gempa bumi terkini';
    var isKal56 = 'Gempa bumi terkini';
    var isKal57 = 'Gempa cek';
    var isKal58 = 'Gempa terbaru';
    var isKal59 = 'Halo BMKG, info gempa terkini';
    var isKal60 = 'Info gempa';
    var isKal61 = 'Info gempa bumi terkini';
    var isKal62 = 'Informasi Gempa Bumi Terkini';
    var isKal63 = 'Oke google. gempa terkini';
    var isKal64 = 'Is it any earthquake today?';
    var isKal65 = 'Seberapa kuat gempa yang sedang terjadi?';
    var isKal66 = 'Tampilkan info gempa terbaru';
    var isKal67 =
        '"Halo BMKG, Informasi kualitas udara di (kota/kabupaten/provinsi)"';
    var isKal68 = '(nama aplikasi) kualitas udara hari ini';
    var isKal69 = ' buat) Kualitas udara hari ini';
    var isKal70 = 'aca, udara gimana skrg?';
    var isKal71 = 'bagaimana kualitas udara hari ini ';
    var isKal72 = 'Bagaimana kualitas udara di Jakarta? ';
    var isKal73 = 'Bagaimana kualitas udara saat ini? ';
    var isKal74 = 'bagaimana kualitas udara';
    var isKal75 = 'Bagaimana kualitas udara hari ini?';
    var isKal76 = 'Aplikasi, tolong tampilkan informasi kualitas udara';
    var isKal77 = 'Bagaimana kulaitas udara hari ini di jakarta selatan';
    var isKal78 = 'kualitas udara hari ini';
    var isKal79 = 'Cek polusi';
    var isKal80 = 'keadaan kualitas udara hari ini';
    var isKal81 = 'Cek info kualitas udara';
    var isKal82 = 'Cek informasi cuaca dan kualitas udara';
    var isKal83 = 'Kualitas udara';
    var isKal84 = 'Polusi udara di kota Kudus';
    var isKal85 = 'Apakah amam kualitas udara hari ini';
    new_text = isKal85.toLowerCase();
    cuaca = new_text.contains(isCuaca);
    hujan = new_text.contains(isHujan);
    gempa = new_text.contains(isGempa);
    udara = new_text.contains(isUdara);
    polusi = new_text.contains(isPolusi);

    if (cuaca) {
      print(isKal85 + "\n True - Cuaca \n");
    }
    if (gempa) {
      print(isKal85 + "\n True - Gempa \n");
    }
    if (udara) {
      print(isKal85 + "\n True - Udara \n");
    }
    if (hujan) {
      print(isKal85 + "\n True - Cuaca \n");
    }
    if (polusi) {
      print(isKal85 + "\n True - Udara \n");
    }
    var isKal86 = 'Air Quality';
    var isKal87 = 'Polusi';
    new_text = isKal87.toLowerCase();
    cuaca = new_text.contains(isCuaca);
    hujan = new_text.contains(isHujan);
    gempa = new_text.contains(isGempa);
    udara = new_text.contains(isUdara);
    polusi = new_text.contains(isPolusi);

    if (cuaca) {
      print(isKal87 + "\n True - Cuaca \n");
    }
    if (gempa) {
      print(isKal87 + "\n True - Gempa \n");
    }
    if (udara) {
      print(isKal87 + "\n True - Udara \n");
    }
    if (hujan) {
      print(isKal87 + "\n True - Cuaca \n");
    }
    if (polusi) {
      print(isKal87 + "\n True - Udara \n");
    }
    var isKal88 = 'Bagaimana kualitas udara ';
    var isKal89 = 'Kadar gas beracun saat ini';
    var isKal90 = 'Udara BMKG';
    var isKal91 = 'Kualitas Udara';
    new_text = isKal91.toLowerCase();
    cuaca = new_text.contains(isCuaca);
    hujan = new_text.contains(isHujan);
    gempa = new_text.contains(isGempa);
    udara = new_text.contains(isUdara);
    polusi = new_text.contains(isPolusi);

    if (cuaca) {
      print(isKal91 + "\n True - Cuaca \n");
    }
    if (gempa) {
      print(isKal91 + "\n True - Gempa \n");
    }
    if (udara) {
      print(isKal91 + "\n True - Udara \n");
    }
    if (hujan) {
      print(isKal91 + "\n True - Cuaca \n");
    }
    if (polusi) {
      print(isKal91 + "\n True - Udara \n");
    }
    var isKal92 = 'Kualitas udara hari ini';
    var isKal93 = 'Kualitas udara hari ini';
    var isKal94 = 'Tingkat polusi';
    var isKal95 = 'Kualitas udara cek';
    var isKal96 = 'kualitas udara ';
    var isKal97 = 'Kondisi udara hari ini';
    var isKal98 = 'Kualitas udara terkini';
    var isKal99 = 'Gimana udara hari ini?';
    new_text = isKal99.toLowerCase();
    cuaca = new_text.contains(isCuaca);
    hujan = new_text.contains(isHujan);
    gempa = new_text.contains(isGempa);
    udara = new_text.contains(isUdara);
    polusi = new_text.contains(isPolusi);

    if (cuaca) {
      print(isKal99 + "\n True - Cuaca \n");
    }
    if (gempa) {
      print(isKal99 + "\n True - Gempa \n");
    }
    if (udara) {
      print(isKal99 + "\n True - Udara \n");
    }
    if (hujan) {
      print(isKal99 + "\n True - Cuaca \n");
    }
    if (polusi) {
      print(isKal99 + "\n True - Udara \n");
    }
    var isKal100 = 'Halo BMKG, info kualitas udara terkini';

/** 
    for (var i = 0; i < 101; i++) {
      kal_text = "isKal" + i.toString();
      new_text = new_text.toLowerCase();
      var cuaca = new_text.contains(isCuaca);
      var hujan = new_text.contains(isHujan);
      var gempa = new_text.contains(isGempa);
      var udara = new_text.contains(isUdara);
      var polusi = new_text.contains(isPolusi);

      if (cuaca) {
        print("isKal" + i.toString() + " True - Cuaca");
      }
      if (gempa) {
        print("isKal" + i.toString() + " True - Gempa");
      }
      if (udara) {
        print("isKal" + i.toString() + " True - Udara");
      }
      if (hujan) {
        print("isKal" + i.toString() + " True - Udara");
      }
      if (polusi) {
        print("isKal" + i.toString() + " True - Udara");
      } lse");
      } **/
  }
}
