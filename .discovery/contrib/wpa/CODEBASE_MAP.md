# contrib/wpa/ — WPA Supplicant Codebase Map

**Path:** `contrib/wpa/`
**Purpose:** WPA/IEEE 802.11i supplicant

## Overview

wpa_supplicant provides WPA/IEEE 802.11i client functionality.

## Key Files

| File | Purpose |
|------|---------|
| `wpa_supplicant/` | Main |
| `hostapd/` | Host AP |

## wpa_supplicant/

| File | Purpose |
|------|---------|
| `wpa_supplicant.c` | Main |
| `wpa.c` | WPA |
| `ctrl_iface.c` | Control interface |
| `driver_wext.c` | WEXT driver |
| `config.c` | Config |
| `eap_peer.c` | EAP peer |
| `eapol_sm.c` | EAPOL SM |

## EAP Methods

| Method | Description |
|--------|-------------|
| EAP-TLS | TLS cert |
| EAP-TTLS | Tunneled TLS |
| PEAP | Protected EAP |
| EAP-SIM | SIM |
| EAP-AKA | UMTS SIM |

## See Also

- `sys/net80211/` - 802.11 stack