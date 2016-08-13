:: RevokeChinaCerts CodeSigning batch
:: Revoke China Certificates.
:: 
:: Author: Hugo Chan, ntkme, Chengr28
:: 


@echo off


:: Check administrative permission.
net session >NUL 2>NUL
if ERRORLEVEL 1 (
	color 4F
	echo Please run as Administrator.
	echo.
	pause & break
	echo.
	cls
)


:: Locate directory and architecture check
cd /D "%~dp0"
set CertMgr="%~dp0Tools\CertMgr.exe"
if %PROCESSOR_ARCHITECTURE%%PROCESSOR_ARCHITEW6432% EQU x86 (set CertMgr="%~dp0Tools\CertMgr_x86.exe")
set Certificates="%~dp0Certificates\CodeSigning
set /A SetForce = 0
set SetForceAppender="%~dp0Tools\SoftCertPolicyAppender\Binary\SoftCertPolicyAppender.exe"


:: Choice
echo RevokeChinaCerts CodeSigning batch
echo.
echo Do you want to set force certificates policy? [Y/N]
echo Setting force require:
echo   Administrative Privileges
echo   Microsoft .NET Framework 4.0+
set /P UserChoice="Choose: "
if /I %UserChoice% EQU Y (set /A SetForce=1)
echo.
echo 1: Revoke all CodeSigning certificates
echo 2: Restore all CodeSigning revoking
echo Notice: Choice version is no longer available. Please delete the certificate(s) in 
echo         /Windows/Certificates/CodeSigning or /Windows/Certificates/Organization folders to 
echo         make it/them not to be revoked in All version.
echo.
set /P UserChoice="Choose: "
set UserChoice=CASE_%UserChoice%
cls
goto %UserChoice%


:: Support functions
:REVOKE
%CertMgr% -add -c %Certificates%\%1.crt" -s -r localMachine Disallowed
goto :EOF

:REVOKE_CHOICE
if /I %1 EQU Y (
	if %SetForce% EQU 0 (
		%CertMgr% -add -c %Certificates%\%2.crt" -s -r localMachine Disallowed
	) else (
		%SetForceAppender% --set-force %Certificates%\%2.crt"
	)
)
goto :EOF

:RESTORE
%CertMgr% -del -c -sha1 %1 -s -r currentUser Disallowed
%CertMgr% -del -c -sha1 %1 -s -r localMachine Disallowed
goto :EOF


:: Revoke version
:CASE_1
if %SetForce% EQU 0 (
	for /F "usebackq tokens=*" %%i in (%Certificates%\CodeSigning.txt") do call :REVOKE %%i
) else (
	%SetForceAppender% --set-force %Certificates%\03FCF1B9FCAB6F7243F3E3E011C6FD28F64F9920.crt" %Certificates%\0C4D32BB2623387CD40C252DDB0F650DE6373385.crt" %Certificates%\0C763003F5360492F9A90B5156E0387961F04993.crt" %Certificates%\0E6193159596F8150ED9ED2A402E67C28FAAC1BE.crt" %Certificates%\1481414E8E87412A00D3341167FE3A92C681B830.crt" %Certificates%\14DE17539FF05E234FAAFAE49CD30870ABD2F5F7.crt" %Certificates%\1540C77B5D19FC5A71A04DB001488E55B45DDC7F.crt" %Certificates%\1B1D4D8444EB54B17CB5B999A50E1D0C0ED1BFE2.crt" %Certificates%\1C1ECDCCF764E6168177C5711F33EC9229A29F88.crt" %Certificates%\1E5BB77FCB63F26277F95AAE09B852699327A08A.crt"
	%SetForceAppender% --set-force %Certificates%\2067B2629A568B4B478EEBD12D9257CC2AF696A8.crt" %Certificates%\2529C0C0D833806AFBFA3C31987C19A18722A2FE.crt" %Certificates%\294952E04EE73FA1935E756841F0FE11477F993B.crt" %Certificates%\297124A7E7D4F2B46BD478AC7263A1369AC1738D.crt" %Certificates%\2B70F74748E600BB0FA155C4ADABD3BF7B877261.crt" %Certificates%\2BDEC50B4446652C126709A08248E572B859CCCC.crt" %Certificates%\2FDD445591CD2EEDBEF8B8A281896A59C08B3DC9.crt" %Certificates%\34E11CCF5897AD9BD37A32FFB2B8F4AA21560847.crt" %Certificates%\355A2A394F51E1D741D034FF102B345D5B27D846.crt" %Certificates%\4099665730474153EADF671B8B475C03C08A46D0.crt"
	%SetForceAppender% --set-force %Certificates%\40B33FA24481DEF470BF2CDF88BABB8754C8489A.crt" %Certificates%\4893C5890F8DA1AFE9DF91EE3AE678B2AC782F41.crt" %Certificates%\49A132170EFAE08EDDD9EE8A241B30BC947ACBD7.crt" %Certificates%\51133A37FFAD0B668844984E77109F29482D7DAB.crt" %Certificates%\52618B2F6389127082A2E208ECD70234019DF6E8.crt" %Certificates%\5477E38783CD37B1E5729B15D7C0873A2D72DB9D.crt" %Certificates%\5C3523B19C304DE2A320E19FD757B3957D69BDD4.crt" %Certificates%\5C4F19D63931C00E239E4227DE41C60AF140F45B.crt" %Certificates%\5C7961E4A7020975FF67414435FA934BA87D1366.crt" %Certificates%\5DC57AF121E3101F4BFEA8A22BBDADC0869C80EE.crt"
	%SetForceAppender% --set-force %Certificates%\5FFFD1A3EAE5ED74558913C4A8476D1514C6D61F.crt" %Certificates%\62DF2BC4B5902B52C215C697D06038E3B28CF5D3.crt" %Certificates%\645E7A1C195EA2C8ED9E34AE1BF3CB9B06FD712E.crt" %Certificates%\6505AD4DC89D1E592A47E839359E6918A0407EBF.crt" %Certificates%\6D6AFC4A6E24B3441B872B9995E37CA8D2BC4609.crt" %Certificates%\76F273B12A88EAB4B086DEB23875E35710446DA7.crt" %Certificates%\78A149F9A04653B01DF09743571DF938F9873FA5.crt" %Certificates%\7909C1ABCD50813B0C3004E7468A3CC4BFAAE34D.crt" %Certificates%\7B6FAE77BD19FEC5410293344B36124774A6D8F1.crt" %Certificates%\7CA5748E69272CB1164C4F6E37E7848A5DE46D96.crt"
	%SetForceAppender% --set-force %Certificates%\87DD03AADF049F0E742AB2978CC190F4764A89BC.crt" %Certificates%\89FB07619BFEC398C258221AB54DB5D761F061FA.crt" %Certificates%\8B46390D86B891E5A3D3AAB2B00D6FDB27A0F791.crt" %Certificates%\8E853D78D6BB8E2911E0F102827C19126D290E36.crt" %Certificates%\935140881F50BDF775D3CEF034C0D21C18FD2567.crt" %Certificates%\93A77CA50F165A5873DD3995874867B616AB3644.crt" %Certificates%\95B1E59D73275C1582D1C7B88B5539E9DA9E2C6F.crt" %Certificates%\978859CE5698F2BFADE1129401CF70856BE738D3.crt" %Certificates%\982414EF52175D9693630F7CD2E69F317886A5F2.crt" %Certificates%\9AB5445104C6CCE5A22431CF29C4331CBC328A1B.crt"
	%SetForceAppender% --set-force %Certificates%\9FFC6F20BA13B92C26B405E8F000213336AD1AA0.crt" %Certificates%\A28C8E7AE778009B5FA55825D94BE73ADAF6A16E.crt" %Certificates%\A34B70840C2B6F718877DDB1C2DE2C27F2C91C43.crt" %Certificates%\A72BBE1C7AA918B5BB1AD8E892DB1095A69C7035.crt" %Certificates%\AB09D1AFE555CFC580575F5BC78B16B9F1C4E432.crt" %Certificates%\ACAED4BE8C729A6AE5F4F82F5F183A9C4EBE7AE3.crt" %Certificates%\AFC10A7F6628C214982E23B1C166A21F0BF3E7DF.crt" %Certificates%\B138DEFA2A4CF7C967515934344AC8649F5234A4.crt" %Certificates%\B28CCC46D234A7D7CF7F21CCB9406F48A5273CC6.crt" %Certificates%\B3B89CD7940DC67E4291A3EE767AC17A3BC9E620.crt"
	%SetForceAppender% --set-force %Certificates%\B6070B587AFB5CEBECA17F2ACA02A0314CBC8839.crt" %Certificates%\B8DE8DBF3807F94364D4978766814637522D660C.crt" %Certificates%\BB22AEDFC634E3DC119B926E648CDE494E12A798.crt" %Certificates%\BBC26FF3B96FF570D96A75ED09FF8F11481E7EF5.crt" %Certificates%\C555780B84AEFA9BAAE26FDA390138713157B6AF.crt" %Certificates%\C57B841B09620EA6278E62AF20963FAEC8F9E03D.crt" %Certificates%\CA1C10FA2E56B5BAD83D087233F15D898EFF0C54.crt" %Certificates%\CB6F65314E5B25D61304AB2C9C8870B574CC21F5.crt" %Certificates%\CC0C4F060CBCC3FCF34397B47D5B3EA66580CFFF.crt" %Certificates%\CC79F55AB07E7A1D5CEC981CEEB864DDA5DC74E3.crt"
	%SetForceAppender% --set-force %Certificates%\CC9467907AD45574588F4E16F29CA36D5F78C0F8.crt" %Certificates%\D02D3BB43F3AFD9D6C77884E2CE4A8E3E47DD07B.crt" %Certificates%\D0AE98E21429702CE68CFB1475D29E59CAC36F54.crt" %Certificates%\D1BB252CAC3D250C55978F7EAAF121DA91A17B42.crt" %Certificates%\D4FB2982268B592E3CD46FA78194E71418297741.crt" %Certificates%\D60C12D1FDB9E45551A00C8815CCD486C043945B.crt" %Certificates%\D91D7B2C0FC2E792041CA3C5D35E67BBADA3C33E.crt" %Certificates%\D9421BEDD9F5B8A91DD3F8691E7A42D83C983325.crt" %Certificates%\DB3EDE9E5C203A4CC43A453F74D06D79C42946D1.crt" %Certificates%\E0387F3AF5752A4620EC617C39153C0E666CF5F8.crt"
	%SetForceAppender% --set-force %Certificates%\E5777A69CAFD7F7C6F89C5297DD1159C7AE9B881.crt" %Certificates%\E87D1C1D3FE2BCA700EB7B8DC0E45B97EAF19405.crt" %Certificates%\E88DD1ACD2DB3A352072AA49C675F4944A3FEF82.crt" %Certificates%\E90DC0AC8B9EAE1DA53292626094CF800CEF2BC0.crt" %Certificates%\EA36152981E296F9763E1DC74B3262D3928563F8.crt" %Certificates%\EB71F776677A00EA1DDBF1358A649E948836452A.crt" %Certificates%\EBA2ADB1C0B7A61E5BA25B8356387F27049BA1A1.crt" %Certificates%\EC6FEFDCED80555081AF88C56F538F7575D8204F.crt" %Certificates%\EEC507F719D5BA0CB913F034E045A24A509D8A5F.crt" %Certificates%\F49A648C69C2F01A0FDEB3992C5AE0A14D5AD9FC.crt"
	%SetForceAppender% --set-force %Certificates%\FA78FD28C1370371E8461D743114BAF1CD08A368.crt"
)
goto EXIT


:: Restore version
:CASE_2
if %SetForce% EQU 1 (
	%SetForceAppender% -r --unset-force %Certificates%\03FCF1B9FCAB6F7243F3E3E011C6FD28F64F9920.crt" %Certificates%\0C4D32BB2623387CD40C252DDB0F650DE6373385.crt" %Certificates%\0C763003F5360492F9A90B5156E0387961F04993.crt" %Certificates%\0E6193159596F8150ED9ED2A402E67C28FAAC1BE.crt" %Certificates%\1481414E8E87412A00D3341167FE3A92C681B830.crt" %Certificates%\14DE17539FF05E234FAAFAE49CD30870ABD2F5F7.crt" %Certificates%\1540C77B5D19FC5A71A04DB001488E55B45DDC7F.crt" %Certificates%\1B1D4D8444EB54B17CB5B999A50E1D0C0ED1BFE2.crt" %Certificates%\1C1ECDCCF764E6168177C5711F33EC9229A29F88.crt" %Certificates%\1E5BB77FCB63F26277F95AAE09B852699327A08A.crt"
	%SetForceAppender% -r --unset-force %Certificates%\2067B2629A568B4B478EEBD12D9257CC2AF696A8.crt" %Certificates%\2529C0C0D833806AFBFA3C31987C19A18722A2FE.crt" %Certificates%\294952E04EE73FA1935E756841F0FE11477F993B.crt" %Certificates%\297124A7E7D4F2B46BD478AC7263A1369AC1738D.crt" %Certificates%\2B70F74748E600BB0FA155C4ADABD3BF7B877261.crt" %Certificates%\2BDEC50B4446652C126709A08248E572B859CCCC.crt" %Certificates%\2FDD445591CD2EEDBEF8B8A281896A59C08B3DC9.crt" %Certificates%\34E11CCF5897AD9BD37A32FFB2B8F4AA21560847.crt" %Certificates%\355A2A394F51E1D741D034FF102B345D5B27D846.crt" %Certificates%\4099665730474153EADF671B8B475C03C08A46D0.crt"
	%SetForceAppender% -r --unset-force %Certificates%\40B33FA24481DEF470BF2CDF88BABB8754C8489A.crt" %Certificates%\4893C5890F8DA1AFE9DF91EE3AE678B2AC782F41.crt" %Certificates%\49A132170EFAE08EDDD9EE8A241B30BC947ACBD7.crt" %Certificates%\51133A37FFAD0B668844984E77109F29482D7DAB.crt" %Certificates%\52618B2F6389127082A2E208ECD70234019DF6E8.crt" %Certificates%\5477E38783CD37B1E5729B15D7C0873A2D72DB9D.crt" %Certificates%\5C3523B19C304DE2A320E19FD757B3957D69BDD4.crt" %Certificates%\5C4F19D63931C00E239E4227DE41C60AF140F45B.crt" %Certificates%\5C7961E4A7020975FF67414435FA934BA87D1366.crt" %Certificates%\5DC57AF121E3101F4BFEA8A22BBDADC0869C80EE.crt"
	%SetForceAppender% -r --unset-force %Certificates%\5FFFD1A3EAE5ED74558913C4A8476D1514C6D61F.crt" %Certificates%\62DF2BC4B5902B52C215C697D06038E3B28CF5D3.crt" %Certificates%\645E7A1C195EA2C8ED9E34AE1BF3CB9B06FD712E.crt" %Certificates%\6505AD4DC89D1E592A47E839359E6918A0407EBF.crt" %Certificates%\6D6AFC4A6E24B3441B872B9995E37CA8D2BC4609.crt" %Certificates%\76F273B12A88EAB4B086DEB23875E35710446DA7.crt" %Certificates%\78A149F9A04653B01DF09743571DF938F9873FA5.crt" %Certificates%\7909C1ABCD50813B0C3004E7468A3CC4BFAAE34D.crt" %Certificates%\7B6FAE77BD19FEC5410293344B36124774A6D8F1.crt" %Certificates%\7CA5748E69272CB1164C4F6E37E7848A5DE46D96.crt"
	%SetForceAppender% -r --unset-force %Certificates%\87DD03AADF049F0E742AB2978CC190F4764A89BC.crt" %Certificates%\89FB07619BFEC398C258221AB54DB5D761F061FA.crt" %Certificates%\8B46390D86B891E5A3D3AAB2B00D6FDB27A0F791.crt" %Certificates%\8E853D78D6BB8E2911E0F102827C19126D290E36.crt" %Certificates%\935140881F50BDF775D3CEF034C0D21C18FD2567.crt" %Certificates%\93A77CA50F165A5873DD3995874867B616AB3644.crt" %Certificates%\95B1E59D73275C1582D1C7B88B5539E9DA9E2C6F.crt" %Certificates%\978859CE5698F2BFADE1129401CF70856BE738D3.crt" %Certificates%\982414EF52175D9693630F7CD2E69F317886A5F2.crt" %Certificates%\9AB5445104C6CCE5A22431CF29C4331CBC328A1B.crt"
	%SetForceAppender% -r --unset-force %Certificates%\9FFC6F20BA13B92C26B405E8F000213336AD1AA0.crt" %Certificates%\A28C8E7AE778009B5FA55825D94BE73ADAF6A16E.crt" %Certificates%\A34B70840C2B6F718877DDB1C2DE2C27F2C91C43.crt" %Certificates%\A72BBE1C7AA918B5BB1AD8E892DB1095A69C7035.crt" %Certificates%\AB09D1AFE555CFC580575F5BC78B16B9F1C4E432.crt" %Certificates%\ACAED4BE8C729A6AE5F4F82F5F183A9C4EBE7AE3.crt" %Certificates%\AFC10A7F6628C214982E23B1C166A21F0BF3E7DF.crt" %Certificates%\B138DEFA2A4CF7C967515934344AC8649F5234A4.crt" %Certificates%\B28CCC46D234A7D7CF7F21CCB9406F48A5273CC6.crt" %Certificates%\B3B89CD7940DC67E4291A3EE767AC17A3BC9E620.crt"
	%SetForceAppender% -r --unset-force %Certificates%\B6070B587AFB5CEBECA17F2ACA02A0314CBC8839.crt" %Certificates%\B8DE8DBF3807F94364D4978766814637522D660C.crt" %Certificates%\BB22AEDFC634E3DC119B926E648CDE494E12A798.crt" %Certificates%\BBC26FF3B96FF570D96A75ED09FF8F11481E7EF5.crt" %Certificates%\C555780B84AEFA9BAAE26FDA390138713157B6AF.crt" %Certificates%\C57B841B09620EA6278E62AF20963FAEC8F9E03D.crt" %Certificates%\CA1C10FA2E56B5BAD83D087233F15D898EFF0C54.crt" %Certificates%\CB6F65314E5B25D61304AB2C9C8870B574CC21F5.crt" %Certificates%\CC0C4F060CBCC3FCF34397B47D5B3EA66580CFFF.crt" %Certificates%\CC79F55AB07E7A1D5CEC981CEEB864DDA5DC74E3.crt"
	%SetForceAppender% -r --unset-force %Certificates%\CC9467907AD45574588F4E16F29CA36D5F78C0F8.crt" %Certificates%\D02D3BB43F3AFD9D6C77884E2CE4A8E3E47DD07B.crt" %Certificates%\D0AE98E21429702CE68CFB1475D29E59CAC36F54.crt" %Certificates%\D1BB252CAC3D250C55978F7EAAF121DA91A17B42.crt" %Certificates%\D4FB2982268B592E3CD46FA78194E71418297741.crt" %Certificates%\D60C12D1FDB9E45551A00C8815CCD486C043945B.crt" %Certificates%\D91D7B2C0FC2E792041CA3C5D35E67BBADA3C33E.crt" %Certificates%\D9421BEDD9F5B8A91DD3F8691E7A42D83C983325.crt" %Certificates%\DB3EDE9E5C203A4CC43A453F74D06D79C42946D1.crt" %Certificates%\E0387F3AF5752A4620EC617C39153C0E666CF5F8.crt"
	%SetForceAppender% -r --unset-force %Certificates%\E5777A69CAFD7F7C6F89C5297DD1159C7AE9B881.crt" %Certificates%\E87D1C1D3FE2BCA700EB7B8DC0E45B97EAF19405.crt" %Certificates%\E88DD1ACD2DB3A352072AA49C675F4944A3FEF82.crt" %Certificates%\E90DC0AC8B9EAE1DA53292626094CF800CEF2BC0.crt" %Certificates%\EA36152981E296F9763E1DC74B3262D3928563F8.crt" %Certificates%\EB71F776677A00EA1DDBF1358A649E948836452A.crt" %Certificates%\EBA2ADB1C0B7A61E5BA25B8356387F27049BA1A1.crt" %Certificates%\EC6FEFDCED80555081AF88C56F538F7575D8204F.crt" %Certificates%\EEC507F719D5BA0CB913F034E045A24A509D8A5F.crt" %Certificates%\F49A648C69C2F01A0FDEB3992C5AE0A14D5AD9FC.crt"
	%SetForceAppender% -r --unset-force %Certificates%\FA78FD28C1370371E8461D743114BAF1CD08A368.crt"
)
for /F "usebackq tokens=*" %%i in (%Certificates%\CodeSigning.txt") do call :RESTORE %%i


:: Exit
:EXIT
echo.
echo RevokeChinaCerts CodeSigning batch
echo Done, please confirm the messages on screen.
echo.
pause
