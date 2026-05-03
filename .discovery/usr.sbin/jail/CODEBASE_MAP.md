# usr.sbin/jail/ — Jail Management Codebase Map

**Path:** `usr.sbin/jail/`
**Purpose:** Jail creation and management

## Key Files

| File | Purpose |
|------|---------|
| `jail.c` | Main |
| `jail.8` | Manual |

## Key Functions

```c
int jail(struct jail *);
int jail_attach(int);
```

## See Also

- `sys/kern/kern_jail.c` - Kernel jail