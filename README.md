# Serverless Log Analyzer (Docker + AWS Lambda) 🚀

Bu proje, AWS S3 üzerine yüklenen log dosyalarını otomatik olarak analiz eden ve hata raporları oluşturan, Docker konteyner tabanlı bir Serverless mimaridir.

## 🛠 Kullanılan Teknolojiler
- **AWS Lambda:** Olay güdümlü (Event-driven) hesaplama.
- **Docker:** Lambda üzerinde çalışan özel Python imajı.
- **Amazon S3:** Ham logların depolanması ve raporların saklanması.
- **Amazon ECR:** Docker imajlarının bulutta barındırılması.
- **Python (Boto3):** S3 üzerindeki dosyaları işleyen analiz scripti.

## 🏗 Mimari Nasıl Çalışıyor?
1. Kullanıcı `raw-logs/` klasörüne bir `.log` veya `.txt` dosyası yükler.
2. S3, bir "Object Created" olayı tetikler.
3. AWS Lambda, ECR'daki Docker konteynerini ayağa kaldırır.
4. Konteyner içindeki Python scripti dosyayı indirir, `ERROR` ve `CRITICAL` satırlarını ayıklar.
5. Sonuçları `reports/` klasörüne yeni bir rapor dosyası olarak yükler.

## 🚀 Kurulum ve Çalıştırma
- Projeyi klonlayın.
- `docker build -t log-analyzer .` ile imajı oluşturun.
- İmajı AWS ECR'a pushlayın.
- Lambda fonksiyonunu bu imajla oluşturun ve S3 tetikleyicisini ekleyin.
