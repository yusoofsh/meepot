# 2025-01-14 21:01:39 by RouterOS 7.16.2

/interface bridge
add name="bridge1 - BP"
add admin-mac=78:9A:18:A0:9B:ED auto-mac=no name="bridge2- HS" \
    port-cost-mode=short
/interface ethernet
set [ find default-name=ether1 ] name="ether1 - ISP"
set [ find default-name=ether2 ] name="ether2 - PC"
set [ find default-name=ether3 ] name="ether3 - HS"
set [ find default-name=ether4 ] name="ether4 - HS"
set [ find default-name=ether5 ] name="ether5 - HS"
set [ find default-name=ether6 ] name="ether6 - HS"
set [ find default-name=ether7 ] disabled=yes
set [ find default-name=ether8 ] disabled=yes
set [ find default-name=sfp-sfpplus1 ] name=sfpplus1
/interface list
add name=WAN
add name=LAN
# /ip hotspot profile
# add dns-name=hotspot.net hotspot-address=10.5.50.1 login-by=\
#     mac,cookie,http-chap,http-pap,trial,mac-cookie mac-auth-mode=\
#     mac-as-username-and-password name=hsprof1 trial-uptime-limit=1m
/ip hotspot user profile
set [ find default=yes ] on-login=":put (\",rem,0,360d,0,,Disable,\"); {:local\
    \_date [ /system clock get date ];:local year [ :pick \$date 7 11 ];:local\
    \_month [ :pick \$date 0 3 ];:local comment [ /ip hotspot user get [/ip ho\
    tspot user find where name=\"\$user\"] comment]; :local ucode [:pic \$comm\
    ent 0 2]; :if (\$ucode = \"vc\" or \$ucode = \"up\" or \$comment = \"\") d\
    o={ /sys sch add name=\"\$user\" disable=no start-date=\$date interval=\"3\
    60d\"; :delay 2s; :local exp [ /sys sch get [ /sys sch find where name=\"\
    \$user\" ] next-run]; :local getxp [len \$exp]; :if (\$getxp = 15) do={ :l\
    ocal d [:pic \$exp 0 6]; :local t [:pic \$exp 7 16]; :local s (\"/\"); :lo\
    cal exp (\"\$d\$s\$year \$t\"); /ip hotspot user set comment=\$exp [find w\
    here name=\"\$user\"];}; :if (\$getxp = 8) do={ /ip hotspot user set comme\
    nt=\"\$date \$exp\" [find where name=\"\$user\"];}; :if (\$getxp > 15) do=\
    { /ip hotspot user set comment=\$exp [find where name=\"\$user\"];}; /sys \
    sch remove [find where name=\"\$user\"]}}"
add !idle-timeout !keepalive-timeout mac-cookie-timeout=5h name=1k-5jam \
    on-login=":put (\",rem,1000,5h,1000,,Enable,\"); {:local date [ /system cl\
    ock get date ];:local year [ :pick \$date 7 11 ];:local month [ :pick \$da\
    te 0 3 ];:local comment [ /ip hotspot user get [/ip hotspot user find wher\
    e name=\"\$user\"] comment]; :local ucode [:pic \$comment 0 2]; :if (\$uco\
    de = \"vc\" or \$ucode = \"up\" or \$comment = \"\") do={ /sys sch add nam\
    e=\"\$user\" disable=no start-date=\$date interval=\"5h\"; :delay 2s; :loc\
    al exp [ /sys sch get [ /sys sch find where name=\"\$user\" ] next-run]; :\
    local getxp [len \$exp]; :if (\$getxp = 15) do={ :local d [:pic \$exp 0 6]\
    ; :local t [:pic \$exp 7 16]; :local s (\"/\"); :local exp (\"\$d\$s\$year\
    \_\$t\"); /ip hotspot user set comment=\$exp [find where name=\"\$user\"];\
    }; :if (\$getxp = 8) do={ /ip hotspot user set comment=\"\$date \$exp\" [f\
    ind where name=\"\$user\"];}; :if (\$getxp > 15) do={ /ip hotspot user set\
    \_comment=\$exp [find where name=\"\$user\"];}; /sys sch remove [find wher\
    e name=\"\$user\"]; [:local mac \$\"mac-address\"; /ip hotspot user set ma\
    c-address=\$mac [find where name=\$user]]}}" parent-queue=none \
    rate-limit=3M/3M
add !idle-timeout !keepalive-timeout mac-cookie-timeout=12h name=2k-12jam \
    on-login=":put (\",rem,2000,12h,2000,,Enable,\"); {:local date [ /system c\
    lock get date ];:local year [ :pick \$date 7 11 ];:local month [ :pick \$d\
    ate 0 3 ];:local comment [ /ip hotspot user get [/ip hotspot user find whe\
    re name=\"\$user\"] comment]; :local ucode [:pic \$comment 0 2]; :if (\$uc\
    ode = \"vc\" or \$ucode = \"up\" or \$comment = \"\") do={ /sys sch add na\
    me=\"\$user\" disable=no start-date=\$date interval=\"12h\"; :delay 2s; :l\
    ocal exp [ /sys sch get [ /sys sch find where name=\"\$user\" ] next-run];\
    \_:local getxp [len \$exp]; :if (\$getxp = 15) do={ :local d [:pic \$exp 0\
    \_6]; :local t [:pic \$exp 7 16]; :local s (\"/\"); :local exp (\"\$d\$s\$\
    year \$t\"); /ip hotspot user set comment=\$exp [find where name=\"\$user\
    \"];}; :if (\$getxp = 8) do={ /ip hotspot user set comment=\"\$date \$exp\
    \" [find where name=\"\$user\"];}; :if (\$getxp > 15) do={ /ip hotspot use\
    r set comment=\$exp [find where name=\"\$user\"];}; /sys sch remove [find \
    where name=\"\$user\"]; [:local mac \$\"mac-address\"; /ip hotspot user se\
    t mac-address=\$mac [find where name=\$user]]}}" parent-queue=none \
    rate-limit=3M/3M
add !idle-timeout !keepalive-timeout mac-cookie-timeout=1d name=3k-24jam \
    on-login=":put (\",rem,3000,24h,3000,,Enable,\"); {:local date [ /system c\
    lock get date ];:local year [ :pick \$date 7 11 ];:local month [ :pick \$d\
    ate 0 3 ];:local comment [ /ip hotspot user get [/ip hotspot user find whe\
    re name=\"\$user\"] comment]; :local ucode [:pic \$comment 0 2]; :if (\$uc\
    ode = \"vc\" or \$ucode = \"up\" or \$comment = \"\") do={ /sys sch add na\
    me=\"\$user\" disable=no start-date=\$date interval=\"24h\"; :delay 2s; :l\
    ocal exp [ /sys sch get [ /sys sch find where name=\"\$user\" ] next-run];\
    \_:local getxp [len \$exp]; :if (\$getxp = 15) do={ :local d [:pic \$exp 0\
    \_6]; :local t [:pic \$exp 7 16]; :local s (\"/\"); :local exp (\"\$d\$s\$\
    year \$t\"); /ip hotspot user set comment=\$exp [find where name=\"\$user\
    \"];}; :if (\$getxp = 8) do={ /ip hotspot user set comment=\"\$date \$exp\
    \" [find where name=\"\$user\"];}; :if (\$getxp > 15) do={ /ip hotspot use\
    r set comment=\$exp [find where name=\"\$user\"];}; /sys sch remove [find \
    where name=\"\$user\"]; [:local mac \$\"mac-address\"; /ip hotspot user se\
    t mac-address=\$mac [find where name=\$user]]}}" parent-queue=none \
    rate-limit=3M/3M
/ip pool
add name=hs-pool-20 ranges=10.5.50.2-10.5.50.254
add name=bp-pool-10 ranges=10.4.40.2-10.4.40.254
/ip dhcp-server
add address-pool=hs-pool-20 interface="bridge2- HS" name=dhcp2
add address-pool=bp-pool-10 interface="bridge1 - BP" name=dhcp1
/ip hotspot
add address-pool=hs-pool-20 addresses-per-mac=1 disabled=no interface=\
    "bridge2- HS" name=hotspot1 profile=hsprof1
/interface bridge port
add bridge="bridge2- HS" interface="ether3 - HS" internal-path-cost=10 \
    path-cost=10
add bridge="bridge2- HS" interface="ether4 - HS" internal-path-cost=10 \
    path-cost=10
add bridge="bridge2- HS" interface="ether5 - HS" internal-path-cost=10 \
    path-cost=10
add bridge="bridge2- HS" interface="ether6 - HS" internal-path-cost=10 \
    path-cost=10
add bridge="bridge2- HS" disabled=yes interface=ether7 internal-path-cost=10 \
    path-cost=10
add bridge="bridge2- HS" disabled=yes interface=ether8 internal-path-cost=10 \
    path-cost=10
add bridge="bridge1 - BP" interface="ether2 - PC"
add bridge="bridge1 - BP" interface=sfpplus1
/ip firewall connection tracking
set udp-timeout=10s
/interface detect-internet
set detect-interface-list=all
/interface list member
add interface="ether1 - ISP" list=WAN
add interface="bridge2- HS" list=LAN
/ip address
add address=10.5.50.1/24 interface="bridge2- HS" network=10.5.50.0
add address=10.4.40.1/24 interface="bridge1 - BP" network=10.4.40.0
/ip dhcp-client
add comment=defconf interface="ether1 - ISP"
/ip dhcp-server network
add address=10.4.40.0/24 dns-server=1.1.1.1,1.0.0.1 gateway=10.4.40.1
add address=10.5.50.0/24 dns-server=1.1.1.1,1.0.0.1 gateway=10.5.50.1
/ip dns
set allow-remote-requests=yes servers=1.1.1.1,1.0.0.1
/ip firewall filter
add action=passthrough chain=unused-hs-chain comment=\
    "place hotspot rules here" disabled=yes
/ip firewall nat
add action=passthrough chain=unused-hs-chain comment=\
    "place hotspot rules here" disabled=yes
add action=masquerade chain=srcnat out-interface="ether1 - ISP"
add action=masquerade chain=srcnat comment="masquerade hotspot network" \
    src-address=10.5.50.0/24
/ip ipsec profile
set [ find default=yes ] dpd-interval=2m dpd-maximum-failures=5
/ip service
set telnet disabled=yes
set ftp disabled=yes
set www disabled=yes
set ssh disabled=yes
set api-ssl disabled=yes
/system clock
set time-zone-name=Asia/Jakarta
/system logging
add action=disk prefix=-> topics=hotspot,info,debug
/system note
set show-at-login=no
/system routerboard settings
set auto-upgrade=yes
