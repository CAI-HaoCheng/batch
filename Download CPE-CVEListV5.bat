@echo off

SET verdir=%cd%
SET Downloads_Name=%userprofile%\Downloads
SET MOVE_Documents_CVE=%verdir%\CVEInfo
SET MOVE_Documents_CPE=%verdir%\CPEInfo





echo CPE 下載
bitsadmin /transfer downloads_CPE /download /priority normal https://nvd.nist.gov/feeds/xml/cpe/dictionary/official-cpe-dictionary_v2.3.xml.zip %Downloads_Name%\official-cpe-dictionary_v2.3.xml.zip
echo CVE 下載
bitsadmin /transfer downloads_CVE /download /priority normal https://nvd.nist.gov/feeds/json/cpematch/1.0/nvdcpematch-1.0.json.zip %Downloads_Name%\nvdcpematch-1.0.json.zip
for /l %%x in (2002, 1, 2022) do (
   bitsadmin /transfer nvdcve-1.1-%%x /download /priority normal https://nvd.nist.gov/feeds/json/cve/1.1/nvdcve-1.1-%%x.json.zip %Downloads_Name%\nvdcve-1.1-%%x.json.zip
)


@ping 127.0.0.1 -n 5 -w 1000 > nul

REM 解壓縮檔案

 for /l %%x in (2002, 1, 2022) do (

  tar.exe -xf %Downloads_Name%\nvdcve-1.1-%%x.json.zip
)

tar.exe -xf %Downloads_Name%\nvdcpematch-1.0.json.zip

tar.exe -xf %Downloads_Name%\official-cpe-dictionary_v2.3.xml.zip

REM 移動檔案

move %verdir%\official-cpe-dictionary_v2.3.xml %MOVE_Documents_CPE%

for /l %%x in (2002, 1, 2022) do (

  move  %verdir%\nvdcve-1.1-%%x.json %MOVE_Documents_CVE%
)

move  %verdir%\nvdcpematch-1.0.json %MOVE_Documents_CVE%


@ping 127.0.0.1 -n 5 -w 1000 > nul

REM 刪除下載檔案

 del /F /S %Downloads_Name%\*.zip

pause
