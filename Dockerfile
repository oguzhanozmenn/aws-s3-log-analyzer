# 1. Temel imaj olarak hafif bir Linux (Alpine) seçiyoruz
FROM alpine:latest

# 2. Gerekli araçları yüklüyoruz (AWS CLI ve Bash)
RUN apk add --no-cache aws-cli bash

# 3. Çalışma dizini oluşturuyoruz
WORKDIR /app

# 4. Yazdığın script'i konteynerın içine kopyalıyoruz
COPY analiz.sh .

# 5. Script'e çalıştırma yetkisi veriyoruz
RUN chmod +x analiz.sh

# 6. Konteyner çalıştığında script'in otomatik başlamasını sağlıyoruz
ENTRYPOINT ["./analiz.sh"]
