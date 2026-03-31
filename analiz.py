import boto3
import os

def handler(event, context):
    s3 = boto3.client('s3')
    
    # Event'ten bucket ve dosya adını al (S3 tetiklediğinde otomatik gelir)
    bucket = event['Records'][0]['s3']['bucket']['name']
    key = event['Records'][0]['s3']['object']['key']
    
    download_path = '/tmp/server.log'
    report_path = '/tmp/incident_report.txt'
    
    print(f"Analiz başlıyor: {bucket}/{key}")
    
    # 1. Dosyayı indir
    s3.download_file(bucket, key, download_path)
    
    # 2. Hataları ayıkla
    errors = []
    with open(download_path, 'r') as f:
        for line in f:
            if "ERROR" in line or "CRITICAL" in line:
                errors.append(line)
    
    # 3. Raporu oluştur
    with open(report_path, 'w') as f:
        f.write(f"--- OTOMATIK LOG RAPORU ---\n")
        f.write(f"Toplam Hata: {len(errors)}\n")
        f.writelines(errors)
        
    # 4. Raporu S3'e (reports klasörüne) yükle
    report_key = f"reports/report_{key.split('/')[-1]}"
    s3.upload_file(report_path, bucket, report_key)
    
    return {
        'statusCode': 200,
        'body': f'Rapor başarıyla oluşturuldu: {report_key}'
    }
