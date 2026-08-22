Import-Module AWS.Tools.S3
$region = "us-east-1"
$bucketName = Read-Host 'enter the s3 bucket name'
Write-Host "AWS Region: $region"
Write-Host "S3 Bucket: $bucketName"

function BucketExists{
 $bucket = Get-S3Bucket -BucketName $bucketName -ErrorAction SilentlyContinue
 return $null -ne $bucket
}
if(-not (BucketExists)){
    Write-Host "bucket does not exists"
    New-S3Bucket -BucketName $bucketName -Region $region
}else {
    Write-Host "bucket alredy exists"
}

#New-S3Bucket -BucketName $bucketName -Region $region

# krijo nje file
$fileName = 'myfile.txt'
$fileContent = 'hello'
Set-Content -Path $fileName -Value $fileContent

Write-S3Object -BucketName $bucketName -File $fileName -Key $fileName