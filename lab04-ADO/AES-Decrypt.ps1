# Replace $Key, $IV, and $EncryptedData
$Key = [Base64_AES_Key];
$IV = [Base64_IV];
$EncryptedData = [Base64_AES_Encrypted_String];

$KeyBytes = [System.Convert]::FromBase64String($Key); 
$IVBytes = [System.Convert]::FromBase64String($IV);
$aes = [System.Security.Cryptography.Aes]::Create();
$aes.Key = $KeyBytes; 
$aes.IV = $IVBytes;
$EncryptedBytes = [System.Convert]::FromBase64String($EncryptedData);
$Decryptor = $aes.CreateDecryptor();
$DecryptedBytes = $Decryptor.TransformFinalBlock($EncryptedBytes,0,$EncryptedBytes.Length);
$DecryptedText = [System.Text.Encoding]::Unicode.GetString($DecryptedBytes);

Write-Host $DecryptedText;