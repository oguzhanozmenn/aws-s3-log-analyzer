#!/bin/bash

# --- DEĞİŞKENLER ---
BUCKET_NAME="log-analyzer-project-oguzhan"
LOG_FILE="server.log"
REPORT_FILE="incident_report.txt"

echo "--- [1/4] Analiz Başlatılıyor ---"

# 1. Dosyayı Çek
echo "S3'ten dosya indiriliyor: $LOG_FILE"
aws s3 cp s3://$BUCKET_NAME/raw-logs/$LOG_FILE .

# 2. Hataları Ayıkla
echo "--- [2/4] Hatalar taranıyor... ---"
grep -E "ERROR|CRITICAL" $LOG_FILE > $REPORT_FILE

# 3. İstatistik Ekle
echo "--- [3/4] Rapor içeriği oluşturuluyor... ---"
TOTAL_ERRORS=$(wc -l < $REPORT_FILE)
echo -e "--- OTOMATIK LOG RAPORU ---\nToplam Kritik Hata Sayısı: $TOTAL_ERRORS\n------------------------" > header.txt
cat $REPORT_FILE >> header.txt
mv header.txt $REPORT_FILE

# 4. Raporu S3'e yükle
echo "--- [4/4] Rapor S3'e yükleniyor... ---"
aws s3 cp $REPORT_FILE s3://$BUCKET_NAME/reports/

echo "--- ISLEM BASARIYLA TAMAMLANDI! ---"
