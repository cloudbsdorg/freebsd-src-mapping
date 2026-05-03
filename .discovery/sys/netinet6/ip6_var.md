# Component: ip6_var.h

**Path:** `sys/netinet6/ip6_var.h`
**Type:** Header
**Maps to:** `.discovery/sys/netinet6/ip6_var.md`

## Purpose

IPv6 variable definitions - External variables and structures for IPv6 protocol.

## Key Definitions

| Item | Purpose |
|------|---------|
| `struct ip6_hdr` | IPv6 header structure |
| `struct ip6_pktopts` | IPv6 packet options |
| `struct ip6_moptions` | IPv6 multicast options |
| Various sysctl OIDs | `net.inet6.ip6.*` sysctl variables |

## Use Cases

| Use | Description |
|-----|-------------|
| `ipv6` | IPv6 |
| `packet` | Packet structures |

## Includes

- `netinet6/in6.h` - IPv6 definitions
- `netinet/in.h` - IPv4 definitions