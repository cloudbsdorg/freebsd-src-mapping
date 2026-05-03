# sys/net80211/ — 802.11 Wireless Stack Codebase Map

**Path:** `sys/net80211/`
**Files:** 43 C source files
**Purpose:** IEEE 802.11 (WiFi) protocol stack

## Overview

The net80211 module provides the 802.11 protocol stack for wireless devices. It handles authentication, association, encryption, and frame processing.

## Core Files

| File | Purpose |
|------|---------|
| `ieee80211.c` | Main 802.11 module |
| `ieee80211_ioctl.c` | ioctl interface |
| `ieee80211_proto.c` | Protocol definitions |
| `ieee80211_node.c` | 802.11 node tables |
| `ieee80211_input.c` | Input processing |
| `ieee80211_output.c` | Output processing |

## Station Mode

| File | Purpose |
|------|---------|
| `ieee80211_sta.c` | Station mode |
| `ieee80211_scan_sw.c` | Software scanning |
| `ieee80211_scan.c` | Scan support |
| `ieee80211_scan_sta.c` | Station scanning |

## Access Point Mode

| File | Purpose |
|------|---------|
| `ieee80211_hostap.c` | Host AP mode |

## Ad-Hoc Mode

| File | Purpose |
|------|---------|
| `ieee80211_adhoc.c` | Ad-hoc mode |
| `ieee80211_mesh.c` | Mesh mode |

## Monitor Mode

| File | Purpose |
|------|---------|
| `ieee80211_monitor.c` | Monitor mode |

## PHY/Radio

| File | Purpose |
|------|---------|
| `ieee80211_phy.c` | PHY layer |
| `ieee80211_radiotap.c` | Radiotap headers |
| `ieee80211_regdomain.c` | Regulatory domains |

## HT (High Throughput - 802.11n)

| File | Purpose |
|------|---------|
| `ieee80211_ht.c` | HT (802.11n) support |

## VHT (Very High Throughput - 802.11ac)

| File | Purpose |
|------|---------|
| `ieee80211_vht.c` | VHT (802.11ac) support |

## TDMA

| File | Purpose |
|------|---------|
| `ieee80211_tdma.c` | TDMA support |

## DFS (Dynamic Frequency Selection)

| File | Purpose |
|------|---------|
| `ieee80211_dfs.c` | Radar detection |

## Power Management

| File | Purpose |
|------|---------|
| `ieee80211_power.c` | Power save |

## Authentication/ACL

| File | Purpose |
|------|---------|
| `ieee80211_xauth.c` | External auth |
| `ieee80211_acl.c` | ACL handling |

## Crypto

| File | Purpose |
|------|---------|
| `ieee80211_crypto.c` | Crypto framework |
| `ieee80211_crypto_wep.c` | WEP |
| `ieee80211_crypto_tkip.c` | TKIP (WPA) |
| `ieee80211_crypto_ccmp.c` | CCMP (WPA2) |
| `ieee80211_crypto_gcm.c` | GCMP (WPA3) |
| `ieee80211_crypto_gcmp.c` | GCMP-256 |
| `ieee80211_crypto_none.c` | No crypto |

## Rate Control

| File | Purpose |
|------|---------|
| `ieee80211_ratectl.c` | Rate control framework |
| `ieee80211_ratectl_none.c` | No rate control |
| `ieee80211_amrr.c` | AMRR (Adaptive Multi-Rate) |
| `ieee80211_rssadapt.c` | RSS adapt |

## Superg (Frame Aggregation)

| File | Purpose |
|------|---------|
| `ieee80211_superg.c` | 802.11n aggregation |

## Mesh Routing

| File | Purpose |
|------|---------|
| `ieee80211_hwmp.c` | HWMP mesh routing |

## WDS (Wireless Distribution System)

| File | Purpose |
|------|---------|
| `ieee80211_wds.c` | WDS support |

## Action Frames

| File | Purpose |
|------|---------|
| `ieee80211_action.c` | Action frames |

## FreeBSD-Specific

| File | Purpose |
|------|---------|
| `ieee80211_freebsd.c` | FreeBSD glue |
| `ieee80211_ddb.c` | DDB commands |

## Debugging

| File | Purpose |
|------|---------|
| `ieee80211_alq.c` | ALQ logging |

## Queue Management

| File | Purpose |
|------|---------|
| `ieee80211_ageq.c` | Age queue |

## 802.11 Frame Structure

```c
// IEEE 802.11 frame header
struct ieee80211_frame {
    u_int16_t i_fc;                // Frame control
    u_int16_t i_dur;               // Duration
    u_int8_t  i_addr1[6];          // Address 1
    u_int8_t  i_addr2[6];          // Address 2
    u_int8_t  i_addr3[6];          // Address 3
    u_int16_t i_seq;               // Sequence control
    // Address 4 (if WDS)
};

struct ieee80211_frame_addr4 {
    u_int8_t  i_addr1[6];
    u_int8_t  i_addr2[6];
    u_int8_t  i_addr3[6];
    u_int16_t i_seq;
    u_int8_t  i_addr4[6];
};
```

### Frame Control

```c
// Frame types
IEEE80211_FC0_TYPE_MASK = 0x0C
IEEE80211_FC0_TYPE_MGT = 0x00
IEEE80211_FC0_TYPE_CTL = 0x04
IEEE80211_FC0_TYPE_DATA = 0x08

// Subtypes
// MGT: assoc req/resq, probe req/resq, beacon, etc.
// CTL: ack, cts, rts, cf-end, etc.
// DATA: data, data+cf-ack, data+cf-poll, etc.
```

## Node Structure

```c
struct ieee80211_node {
    struct ieee80211vap *ni_vap;   // Parent VAP
    u_int8_t      ni_macaddr[6];   // MAC address
    u_int8_t      ni_bssid[6];     // BSSID
    int16_t       ni_rssi;         // RSSI
    int16_t       ni_noise;        // Noise
    u_int8_t      ni_chan;         // Channel
    u_int16_t     ni_capinfo;      // Capability
    u_int16_t     ni_fhdzero;      // ??? */
    u_int32_t     ni_flags;        // Flags
    // ... more
};
```

## VAP (Virtual Access Point)

```c
struct ieee80211vap {
    struct ifnet *iv_ifp;          // Network interface
    struct ieee80211com *iv_ic;    // 802.11 common
    enum ieee80211_state iv_state; // State machine
    // ... more
};

enum ieee80211_state {
    IEEE80211_S_INIT = 0,      // Initial
    IEEE80211_S_SCAN = 1,      // Scanning
    IEEE80211_S_AUTH = 2,      // Authenticating
    IEEE80211_S_ASSOC = 3,     // Associating
    IEEE80211_S_RUN = 4,       // Running
};
```

## Supported Rates

```c
// Rate IE
struct ieee80211_rateset {
    u_int8_t    len;                // Number of rates
    u_int8_t    rs_rates[16];       // Rates (in 500kbps units)
};

// Common rates
#define IEEE80211_RATE(re) ((re) & IEEE80211_RATE_VAL)
```

## Key Dependencies

```c
#include <net80211/ieee80211_var.h>   // 802.11 variables
#include <net80211/ieee80211_ioctl.h> // ioctl
#include <net/if_var.h>               // Network interface
#include <netinet/in_var.h>           // INET
```

## See Also

- `sys/dev/iwn/` - Intel WiFi drivers
- `sys/dev/ath/` - Atheros drivers
- `sys/dev/wlan/` - WLAN drivers