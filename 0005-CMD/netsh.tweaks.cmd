@ECHO OFF
echo BEFORE
netsh int tcp show global
echo TUNING NETSH TCP SETUP
netsh interface tcp set heuristics disabled
netsh interface tcp set global autotuninglevel=disabled
:: netsh interface ipv6 isatap set state disabled
:: netsh interface ipv6 set teredo disabled
:: netsh wlan stop hostednetwork
:: netsh wlan set hostednetwork mode=disallow
echo AFTER
netsh int tcp show global