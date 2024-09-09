{
  "log": {
    "disabled": false,
    "level": "info",
    "output": "/etc/sing-box/sb.log",
    "timestamp": true
  },
  "dns": {
    "servers": [
      {
        "tag": "sandbox",
        "address": "tls://8.8.8.8"
      }
    ]
  },
  "inbounds": [
    {
        "tag": "vless-reality-vesion",
        "type": "vless",
        "listen": "::",
        "listen_port": 22624,
	"sniff": false,
        "sniff_override_destination": false,
	"tcp_fast_open": false,
        "tcp_multi_path": true,
        "users": [
            {
              "uuid": "aa02b8c0-8c21-43fe-8501-b0c499c99e99",
              "flow": "xtls-rprx-vision"
            }
        ],
        "tls": {
            "enabled": true,
            "server_name": "www.iij.ad.jp",
            "reality": {
                "enabled": true,
                "handshake": {
                    "server": "www.iij.ad.jp",
                    "server_port": 443
                },
                "private_key": "iGCp7R6vg3Dozen2wVuUJ5UvVYdl4_O6yhN_Rvh4z0Q",
                "short_id": [
                  ""
                ]
            }
        }
    },
    {
        "tag": "vmess-ws",
        "type": "vmess",
        "listen": "::",
        "listen_port": 8001,
	"sniff": false,
        "sniff_override_destination": false,
	"tcp_fast_open": false,
        "tcp_multi_path": true,
        "users": [
        {
            "uuid": "aa02b8c0-8c21-43fe-8501-b0c499c99e99"
        }
    ],
    "transport": {
        "type": "ws",
        "path": "/vmess",
        "early_data_header_name": "Sec-WebSocket-Protocol"
        }
    },
    {
        "tag": "hysteria2",
        "type": "hysteria2",
        "listen": "::",
        "listen_port": 5353,
        "sniff": true,
        "sniff_override_destination": true,
	"tcp_fast_open": false,
        "tcp_multi_path": true,
        "users": [
            {
                "password": "aa02b8c0-8c21-43fe-8501-b0c499c99e99"
            }
        ],
        "ignore_client_bandwidth":false,
        "masquerade": "https://bing.com",
        "tls": {
            "enabled": true,
            "alpn": [
                "h3"
            ],
            "min_version":"1.3",
            "max_version":"1.3",
            "certificate_path": "/etc/sing-box/cert.pem",
            "key_path": "/etc/sing-box/private.key"
        }

    },
    {
        "tag": "tuic",
        "type": "tuic",
        "listen": "::",
        "listen_port": 53,
        "sniff": true,
        "sniff_override_destination": true,
	"tcp_fast_open": false,
        "tcp_multi_path": true,
        "users": [
          {
            "uuid": "aa02b8c0-8c21-43fe-8501-b0c499c99e99",
            "password": "kcptun"
          }
        ],
        "congestion_control": "bbr",
	"zero_rtt_handshake": false,
        "tls": {
            "enabled": true,
            "alpn": [
                "h3"
            ],
        "certificate_path": "/etc/sing-box/cert.pem",
        "key_path": "/etc/sing-box/private.key"
       }
    }
  ],
  "outbounds": [

    {
      "type": "direct",
      "tag": "direct"
    }

  ],
  "route": {

    "final": "direct"

   },
   "experimental": {
      "cache_file": {
      "enabled": true,
      "path": "/etc/sing-box/cache.db",
      "cache_id": "mycacheid",
      "store_fakeip": true
    }
  }
}
