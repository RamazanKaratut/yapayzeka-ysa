Yapay Sinir Ağı (YSA) Tabanlı Tahmin Modeli
Bu depo, MATLAB kullanarak bir Yapay Sinir Ağı (YSA) modelinin eğitimi, testi ve performans değerlendirmesini içeren kodları barındırmaktadır. Model, belirli giriş verilerinden (Egitim) çıktıları (EgitimC) öğrenerek, daha önce görmediği test verileri (Test) üzerinde tahminler yapmayı amaçlar.

İçerik
Ana MATLAB kodu: YSA modelinin tanımlandığı, eğitildiği, test edildiği ve performans metriklerinin hesaplandığı komutları içerir.

ysaworkspace.mat: YSA eğitimi ve testi için gerekli olan Egitim, EgitimC, Test ve TestC verilerini içeren MATLAB çalışma alanı dosyası.

Nasıl Çalışır?
MATLAB kodu aşağıdaki temel adımları gerçekleştirir:
Veri Yükleme: ysaworkspace.mat dosyasından Egitim, EgitimC, Test ve TestC veri setlerini yükler. Bu veriler, YSA'nın eğitilmesi ve test edilmesi için kullanılır.

YSA Oluşturma:
newff fonksiyonu kullanılarak çok katmanlı ileri beslemeli (feedforward) bir yapay sinir ağı oluşturulur.
Ağ mimarisi [5 2 3 4 1] olarak tanımlanmıştır (5 giriş nöronu, ara katmanlarda sırasıyla 2, 3, 4 nöron ve 1 çıkış nöronu).
Aktivasyon fonksiyonları olarak tansig (gizli katmanlar için) ve purelin (çıkış katmanı için) kullanılır.
Eğitim algoritması traingdx (Gradyan İniş ve Momentum ile Geri Yayılım) olarak belirlenmiştir.

YSA Ayarlarını Yapılandırma:
epochs: Eğitim tekrar sayısı (1000).
show: Eğitim ilerlemesini gösterme sıklığı (her 5 epoch'ta bir).
goal: Hedef hata değeri (1e-5).
lr: Öğrenme oranı (0.3).
mc: Momentum katsayısı (0.7).
min_grad: Minimum gradyan değeri (1e-10).

Eğitim: YSA, Egitim girişleri ve EgitimC çıktıları kullanılarak eğitilir.
Test ve Tahmin: Eğitilmiş ağ, Test verileri üzerinde tahminler (Tahmin) yapar. NaN değerleri 0'a dönüştürülür.

Performans Değerlendirme:
Ortalama Karesel Hata (MSE - Mean Squared Error): Tahminler ile gerçek değerler arasındaki farkın karelerinin ortalaması hesaplanır.
Belirleme Katsayısı (R 
2
 ): Modelin, bağımlı değişkendeki varyansın ne kadarını açıkladığını gösteren bir ölçüt hesaplanır.
 
Görselleştirme: Tahmin edilen değerler (Tahmin) ile gerçek test değerleri (TestC) bir grafik üzerinde görselleştirilerek modelin performansı görsel olarak karşılaştırılır.

Kullanım
MATLAB yazılımını bilgisayarınıza kurun.
Bu depodaki MATLAB kodunu (bir .m dosyası olarak kaydedilmiş) ve ysaworkspace.mat dosyasını aynı dizine yerleştirin.
MATLAB ortamında .m dosyasını açın.
Kodu çalıştırmak için MATLAB komut penceresine dosyanın adını yazın (örneğin, main_ysa_script eğer dosyanızın adı buysa) veya "Run" butonuna tıklayın.
Kod çalıştırıldığında, YSA modeli eğitilecek, test edilecek, performans metrikleri komut penceresinde gösterilecek ve tahminler ile gerçek değerlerin karşılaştırmalı grafiği çizilecektir.
