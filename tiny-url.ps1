function New-TinyUrl($url) {
    curl.exe "https://tinyurl.com/api-create.php?url=$url"
}
Set-Alias tiny New-TinyUrl
