# 🚀 AWS S3 Automated Log Analyzer

Bu proje, AWS CloudShell ve S3 servislerini kullanarak sunucu günlüklerini (logs) otomatik olarak analiz eden bir Bash script otomasyonudur.

## 🛠 Kullanılan Teknolojiler
* **Bulut Sağlayıcı:** AWS (Amazon Web Services)
* **Depolama:** Amazon S3
* **Ortam:** AWS CloudShell (Linux Terminal)
* **Dil:** Bash Scripting (Grep, Sed, Awk)

## 📋 Proje Akışı
1. S3 üzerindeki `raw-logs` klasöründen ham log dosyası çekilir.
2. Bash script, dosya içindeki **ERROR** ve **CRITICAL** seviyesindeki hataları ayıklar.
3. Bulunan hata sayısı hesaplanır ve bir özet rapor oluşturulur.
4. Oluşturulan `incident_report.txt` dosyası S3 üzerindeki `reports` klasörüne geri yüklenir.

## 🚀 Nasıl Çalıştırılır?
```bash
chmod +x analiz.sh
./analiz.sh
```
