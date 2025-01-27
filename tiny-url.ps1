function New-TinyUrl($url) {
    irm "https://tinyurl.com/api-create.php?url=$url"
}
Set-Alias tiny New-TinyUrl
