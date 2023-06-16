@echo off

echo CPE download
start https://nvd.nist.gov/feeds/xml/cpe/dictionary/official-cpe-dictionary_v2.3.xml.zip
echo CVE download
start https://nvd.nist.gov/feeds/json/cpematch/1.0/nvdcpematch-1.0.json.zip
for /l %%x in (2002, 1, 2022) do (
   start https://nvd.nist.gov/feeds/json/cve/1.1/nvdcve-1.1-%%x.json.zip
)

@ping 127.0.0.1 -n 5 -w 1000 > nul
for /l %%x in (2002, 1, 2022) do (
move "%userprofile%\Downloads\nvdcve-1.1-%%x.json.zip" "%userprofile%\Documents\B285\Setup_Application_Build31\Install-Files\CVEInfo"
)

@ping 127.0.0.1 -n 5 -w 1000 > nul

move "%userprofile%\Downloads\official-cpe-dictionary_v2.3.xml.zip" "%userprofile%\Documents\B285\Setup_Application_Build31\Install-Files\CPEInfo"
move "%userprofile%\Downloads\nvdcpematch-1.0.json.zip" "%userprofile%\Documents\B285\Setup_Application_Build31\Install-Files\CVEInfo"
 for /l %%x in (2002, 1, 2022) do (

  tar.exe -xf %userprofile%\Documents\B285\Setup_Application_Build31\Install-Files\CVEInfo\nvdcve-1.1-%%x.json.zip
)

tar.exe -xf %userprofile%\Documents\B285\Setup_Application_Build31\Install-Files\CVEInfo\nvdcpematch-1.0.json.zip

tar.exe -xf %userprofile%\Documents\B285\Setup_Application_Build31\Install-Files\CPEInfo\official-cpe-dictionary_v2.3.xml.zip

move "%userprofile%\Documents\B285\Setup_Application_Build31\Install-Files\CVEInfo\official-cpe-dictionary_v2.3.xml" "%userprofile%\Documents\B285\Setup_Application_Build31\Install-Files\CPEInfo"

@ping 127.0.0.1 -n 5 -w 1000 > nul

 del /F /S %userprofile%\Documents\B285\Setup_Application_Build31\Install-Files\CPEInfo\*.zip
 del /F /S %userprofile%\Documents\B285\Setup_Application_Build31\Install-Files\CVEInfo\*.zip
 pause

