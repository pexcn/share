Ref: https://github.com/google/bbr/blob/v2alpha/README.md

```bash
# enable bbr2
sysctl -w net.core.default_qdisc=fq_codel
sysctl -w net.ipv4.tcp_congestion_control=bbr2

# enable bbr2 ecn
sysctl -w net.ipv4.tcp_ecn=1
echo 1 > /sys/module/tcp_bbr2/parameters/ecn_enable
```
