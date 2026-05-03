# Component: in6_var.h

**Path:** `sys/netinet6/in6_var.h`
**Type:** Header
**Maps to:** `.discovery/sys/netinet6/in6_var.md`

## Purpose

IPv6 variable definitions - Internal variables and sysctl knobs for IPv6.

## Key Definitions

| Item | Purpose |
|------|---------|
| `struct in6_ifreq` | IPv6 interface request |
| `struct in6_aliasreq` | IPv6 alias request |
| Various sysctl OIDs | `net.inet6.*` sysctl variables |

## Use Cases

| Use | Description |
|-----|-------------|
| `ipv6` | IPv6 |
| `sysctl` | Sysctl interface |

## Includes

- `netinet6/in6.h` - IPv6 definitions
- `netinet6/ip6_var.h` - IPv6 variable definitions