# TCP BBR congestion control (with the fq qdisc) for better network
# throughput.
_: {
  boot.kernel.sysctl = {
    "net.core.default_qdisc" = "fq";
    "net.ipv4.tcp_congestion_control" = "bbr";
  };
}
