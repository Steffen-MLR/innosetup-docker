## How to sign Installer Files integrated?

1. get your Authenticate PFX File
2. run iscc like this:
```
iscc "your-installer-file.iss" /Oinstaller /F<your-name> '/Ssigntool=Z:\opt\osslsigncode.bat <PASSWORD> <PATH_TO_PFX> https://example.com $f'
```

> **_IMPORTANT:_**
> 
> The Path to PFX needs to be Wine Syntax, which means:
> `/opt/cert.pfx -> Z:\opt\cert.pfx`