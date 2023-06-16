@echo off

echo CPE download
start https://nvd.nist.gov/feeds/xml/cpe/dictionary/official-cpe-dictionary_v2.3.xml.zip
echo CVE download
start https://nvd.nist.gov/feeds/json/cpematch/1.0/nvdcpematch-1.0.json.zip
for /l %%x in (2002, 1, 2022) do (
   start https://nvd.nist.gov/feeds/json/cve/1.1/nvdcve-1.1-%%x.json.zip
)

@ping 127.0.0.1 -n 5 -w 1000 > nul

 for /l %%x in (2001, 1, 2022) do (
  7z x "%userprofile%\Downloads\nvdcve-1.1-%%x.json.zip" -o"%userprofile%\Documents\B285\Setup_Application_Build31\Install-Files\CVEInfo" -y
)

7z x "%userprofile%\Downloads\official-cpe-dictionary_v2.3.xml.zip" -o"%userprofile%\Documents\B285\Setup_Application_Build31\Install-Files\CPEInfo" -y

@ping 127.0.0.1 -n 5 -w 1000 > nul

del /F /S %userprofile%\Downloads\*.zip
