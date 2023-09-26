## fortilog-csv-powershell
Convert FortiLog from FortiGate or FortiAnalyzer to CSV using PowerShell

### Usage

Example: Export logs from FortiGate or FortiAnalyzer as _.csv_

`.\ConvertFortiLogToCsv.ps1 fortilog-test.log`

### FortiLog example

`eg. fortilog-test.log`

```
date=2023-09-26 time=10:21:30 id=7283046867846300286 itime="2023-09-26 10:21:30" euid=3 epid=10303 dsteuid=3 dstepid=10106 logflag=32 logver=702051517 type="traffic" subtype="forward" level="notice" action="accept" policyid=6 sessionid=21160262 srcip=10.10.1.1 dstip=10.10.1.2 srcport=62445 dstport=3389 trandisp="noop" duration=73145 proto=17 sentbyte=431693 rcvdbyte=2296262 sentdelta=320 rcvddelta=320 sentpkt=7060 rcvdpkt=8246 logid=0000000020 service="MMS" app="MMS" appcat="unscanned" srcintfrole="undefined" dstintfrole="undefined" policytype="policy" eventtime=1695716489932089045 poluuid="00000-0000-0000-0000-000000000" srccountry="Reserved" dstcountry="Reserved" srcintf="port2" dstintf="port2" policyname="review:13-9 - temp landingzone all " tz="+0200" devid="xxxxxxx" vd="root" csf="Fabric" dtime="2023-09-26 10:21:30" itime_t=1695716490 devname="fgate01"

date=2023-09-26 time=10:20:45 id=7283046674572771587 itime="2023-09-26 10:20:45" euid=3 epid=10303 dsteuid=3 dstepid=10358 logflag=32 logver=702051517 type="traffic" subtype="forward" level="notice" action="accept" policyid=6 sessionid=21289580 srcip=10.10.1.1 dstip=10.10.1.3 srcport=58371 dstport=1433 trandisp="noop" duration=67030 proto=6 sentbyte=1191234 rcvdbyte=728382 sentdelta=2492 rcvddelta=1516 sentpkt=11413 rcvdpkt=9619 logid=0000000020 service="MS-SQL" app="MS-SQL" appcat="unscanned" srcintfrole="undefined" dstintfrole="undefined" policytype="policy" eventtime=1695716445274561545 poluuid="00000-0000-0000-0000-000000000" srccountry="Reserved" dstcountry="Reserved" srcintf="port2" dstintf="port2" policyname="review:13-9 - temp landingzone all " tz="+0200" devid="xxxxxxx" vd="root" csf="Fabric" dtime="2023-09-26 10:20:45" itime_t=1695716445 devname="fgate01"
```

### Output example _(placed enters for readability)_ 

eg. `fortilog-test.csv`

```
"appcat","app","sessionid","policyid","srcintf","dsteuid","poluuid","csf","action","rcvddelta","trandisp","service","policytype","rcvdbyte","srcport","vd","dstport","srcintfrole","logver","devid","epid","itime","rcvdpkt","euid","sentpkt","type","logid","dstepid","dstintfrole","dstcountry","date","sentbyte","itime_t","duration","dtime","srcip","logflag","dstip","dstintf","srccountry","devname","level","eventtime","policyname","id","time","sentdelta","subtype","proto"

"unscanned","MMS","21160262","6","port2","3","00000-0000-0000-0000-000000000","Fabric","accept","320","noop","MMS","policy","2296262","62445","root","3389","undefined","702051517","xxxxxxx","10303","2023-09-26 10:21:30","8246","3","7060","traffic","0000000020","10106","undefined","Reserved","2023-09-26","431693","1695716490","73145","2023-09-26 10:21:30","10.10.1.1","32","10.10.1.2","port2","Reserved","fgate01","notice","1695716489932089045","review:13-9 - temp landingzone all ","7283046867846300286","10:21:30","320","forward","17"

"unscanned","MS-SQL","21289580","6","port2","3",
"00000-0000-0000-0000-000000000","Fabric","accept","1516","noop","MS-SQL","policy","728382","58371","root","1433","undefined","702051517","xxxxxxx","10303","2023-09-26 10:20:45","9619","3","11413","traffic","0000000020","10358","undefined","Reserved","2023-09-26","1191234","1695716445","67030","2023-09-26 10:20:45","10.10.1.1","32","10.10.1.3","port2","Reserved","fgate01","notice","1695716445274561545","review:13-9 - temp landingzone all ","7283046674572771587","10:20:45","2492","forward","6"

```

Credits go to:
- @N4SOC https://github.com/N4SOC/fortilogcsv
- ChatGPT _(for converting this flawlessly from Python to PowerShell. I have not changed any character after generating)_