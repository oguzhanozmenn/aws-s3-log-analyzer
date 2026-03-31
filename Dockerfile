# AWS'nin resmi Lambda Python imajını kullanıyoruz
FROM public.ecr.aws/lambda/python:3.9

# Script'i kopyala
COPY analiz.py ${LAMBDA_TASK_ROOT}

# Lambda'nın çalıştıracağı fonksiyonu belirt
CMD [ "analiz.handler" ]
