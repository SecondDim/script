# 就筆記一下

## 原生服務的相關使用

```bash
# 重啟服務
sudo systemctl restart systemd-timesyncd.service

# 狀態
timedatectl
timedatectl timesync-status
timedatectl show-timesync

# 編輯 config
sudo vim /etc/systemd/timesyncd.conf

# 開關 ntp sync
timedatectl set-ntp true
timedatectl set-ntp false

# 硬體(要外加)
hwclock -r
hwclock -w
```

## 幾個好用 NTP server
```txt
ntp.ntu.edu.tw
time.google.com
time.windows.com
time.facebook.com

# 國家實驗室 https://www.stdtime.gov.tw/chinese/bulletin/NTP%20promo.txt
tick.stdtime.gov.tw
tock.stdtime.gov.tw
time.stdtime.gov.tw
clock.stdtime.gov.tw
watch.stdtime.gov.tw
```

## 一些補充資訊
1. ptp(2002年) 比 ntp 精準，提供 ns 等級同步，不過要硬體支援
2. 國家實驗室的資訊已經有點過時
3. 這些都是 UTC 時間
4. UTC, UT1, ITA, GMT 這幾個關鍵字可以瞭解一下
5. 同步時間的方式還有: 短波授時, GPS
