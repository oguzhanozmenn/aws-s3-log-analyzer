{
    "repository": {
        "repositoryArn": "arn:aws:ecr:eu-central-1:628070017883:repository/s3-log-analyzer",
        "registryId": "628070017883",
        "repositoryName": "s3-log-analyzer",
        "repositoryUri": "628070017883.dkr.ecr.eu-central-1.amazonaws.com/s3-log-analyzer",
        "createdAt": "2026-03-31T14:32:37.672000+00:00",
        "imageTagMutability": "MUTABLE",
        "imageScanningConfiguration": {
            "scanOnPush": false
        },
        "encryptionConfiguration": {
            "encryptionType": "AES256"
        }
    }
}
