---
author: rs
title: How To Fix `skey_protected could not be decrypted` Error
date: 2024-12-10 02:00:00 -0500 
categories: [duo]
tags: [duo,skey_protected]
---

**[error] The protected value for skey_protected could not be decrypted and therefore cannot be used. This may happen if the secret was encrypted on a different machine and copied to this machine. Please try protecting this value again.** 

#### Reference Articles:  
- [Duo Knowledge Base Article 5921](https://help.duo.com/s/article/5921?language=en_US)  
- [Duo Knowledge Base Article 2340](https://help.duo.com/s/article/2340?language=en_US)  

---

#### **1. Open an Administrator Command Prompt**

#### **2. Stop Duo Authentication Proxy Service and Close Duo Authentication Proxy Manager Application**
  ```
net stop DuoAuthProxy
  ```
  ``` 
taskkill /IM Duo_Authentication_Proxy_Manager.exe /F
  ```

#### **3. Navigate to the Installation Directory**
  ```
cd "C:\Program Files\Duo Security Authentication Proxy\bin"
  ```

#### **4. Generate a New Encrypted Key**
- Use the `authproxy_passwd.exe` tool to re-encrypt your Duo secret key `<skey>`.
- Replace `<skey>` with your actual secret key from Duo:
  ```
  authproxy_passwd.exe <skey>
  ```
  or use this command to auto-encrypt all plaintext values in authproxy.cfg that require encryption. See this reference article [Duo Knowledge Base Article 2340](https://help.duo.com/s/article/2340?language=en_US) for further explanation.
  ```
  "C:\Program Files\Duo Security Authentication Proxy\bin\authproxy_passwd.exe" --whole-config
  ```

#### **5. Update the Configuration File (authproxy.cfg)**
```
notepad.exe "C:\Program Files\Duo Security Authentication" Proxy\conf\authproxy.cfg
```
- Locate the line that begins with `skey_protected` authproxy.cfg and replace the old value with the new encrypted value you just generated:
  ```ini
  skey_protected=encrypted_key
  ```

#### **6. Restart the Duo Authentication Proxy Service**
```
net start DuoAuthProxy
```

#### **7. Test the Configuration**

```
"C:\Program Files\Duo Security Authentication Proxy\bin\authproxy_connectivity_tool.exe"
```