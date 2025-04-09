import 'package:flutter/material.dart';
import 'package:genclik_spor/screens/common/components/custom_appbar.dart';
import 'package:genclik_spor/screens/common/components/custom_button.dart';
import 'package:genclik_spor/utils/colors.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar('Tarihçe'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  'Tarihçe',
                  style: TextStyle(
                    color: offdarkblue1,
                    fontSize: 16,
                  ),
                ),
              ),
              Text(
                "Gençlik ve Spor Bakanlığı'nın kurulması; 6/4/2011 tarihli ve 6223 sayılı Kanunun verdiği yetkiye dayanılarak, Bakanlar Kurulu'nca 3/6/2011 tarihinde kararlaştırılmıştır.",
                style: TextStyle(
                  color: grey,
                  fontSize: 10,
                ),
              ),
              Text(
                "29 Haziran 1938 tarihinde kabul edilen 3530 sayılı kanunla Beden Terbiyesi Genel Müdürlüğü kuruldu. 1969 Türkiye genel seçimlerinin ardından ilk kez Spor Bakanlığı adıyla kurulan bakanlığın başına 3 Kasım 1969 tarihinde İsmet Sezgin atandı. 1972 yılında adı Gençlik ve Spor Bakanlığı olarak değiştirildi. 1983 Türkiye genel seçimlerinin ardından ise Milli Eğitim, Gençlik ve Spor Bakanlığı adını aldı. 1 Nisan 1989'dan itibaren Gençlik ve Spordan Sorumlu Devlet Bakanlığı ile Gençlik ve Spor Genel Müdürlüğü olarak faaliyetlerine devam etti. 2011 yılında ise Türkiye Cumhuriyeti Gençlik ve Spor Bakanlığı adıyla yeniden kuruldu.",
                style: TextStyle(
                  color: grey,
                  fontSize: 10,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  'Gençlik ve Spor Bakanlığının görev ve yetkileri şunlardır:',
                  style: TextStyle(
                    color: offdarkblue1,
                    fontSize: 16,
                  ),
                ),
              ),
              Text(
                '''          1- Gençliğin kişisel ve sosyal gelişimini destekleyici politikaların tespiti amacıyla gerekli çalışmaları yapmak, farklı genç gruplarının ihtiyaçlarını da dikkate alarak gençlerin kendi potansiyellerini gerçekleştirebilmelerine imkân sağlamak, karar alma ve uygulama süreçleri ile sosyal hayatın her alanına etkin katılımını sağlayıcı öneriler geliştirmek ve bu doğrultuda faaliyetler yürütmek, ilgili kurumların gençliği ilgilendiren hizmetlerinde koordinasyon ve işbirliğini sağlamak.
            
          2- Gençliğin ihtiyaçları ile gençliğe sunulan hizmet ve imkânlar konusunda inceleme ve araştırmalar yapmak ve öneriler geliştirmek, gençlik alanında bilgilendirme, rehberlik ve danışmanlık yapmak.
          
          3- Gençlik çalışma ve projelerine ilişkin usul ve esasları belirlemek.
          
          4- Gençlik çalışma ve projeleri yapmak, bu çalışma ve projeleri desteklemek, bunların uygulama ve sonuçlarını denetlemek.
          
          5- Spor faaliyetlerinin plan ve program dâhilinde ve mevzuata uygun bir şekilde yürütülmesini gözetmek, gelişmesini ve yaygınlaşmasını teşvik edici tedbirler almak.
          
          6- Spor alanında uygulanacak politikaların tespit edilmesi amacıyla gerekli çalışmaları yapmak, teşkilatlanma, federasyonların bağımsızlığı, spor tesisleri, eğitim, sponsorluk, sporcu sağlığının korunması, uluslararası organizasyonlarla ilgili çalışmaları koordine etmek, değerlendirmek ve denetlemek.
          
          7- Spor kuruluşlarının kurulmasına ve diğer hususlara ilişkin usul ve esasları tespit etmek.
          
          8- Gençlik ve spor kulüpleri ile başarılı sporcuları ve çalıştırıcıları desteklemek.
          
          9- Yurt yapmak, yaptırmak, işletmek, işlettirmek, desteklemek ve yurt hizmetlerine ilişkin usul ve esasları belirlemek.
          
          10- Öğrencilere verilecek öğrenim kredisi, burs ve diğer yardımlara ilişkin hizmetleri yürütmek ve bunlara dair usul ve esasları belirlemek.
          
          11- Bakanlık hizmetlerini destekleyici arsa ve arazi temin etmek, bina ve tesis yapmak, yaptırmak, satın almak, kiralamak, devretmek, devralmak ve bu hizmetlerle ilgili her türlü mali ve ekonomik girişimde bulunmak.
          
          12- Kanunlarla veya Cumhurbaşkanlığı kararnameleriyle verilen diğer görevleri yapmak.''',
                style: TextStyle(
                  color: grey,
                  fontSize: 10,
                ),
              ),
              const SizedBox(height: 20),
              customButton(
                  context: context,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  text: 'Geri Dön'),
            ],
          ),
        ),
      ),
    );
  }
}
