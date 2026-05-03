# sys/dts/ — Device Tree Source Codebase Map

**Path:** `sys/dts/`
**Purpose:** Device Tree Source (DTS/DTB) files for embedded systems

## Overview

The dts directory contains Device Tree Source files describing hardware for embedded ARM systems.

## Key Files

| File | Purpose |
|------|---------|
| `*.dts` | Device Tree Source |
| `*.dtsi` | Device Tree Include |

## DTS Example

```
/ {
    model = "Vendor Board";
    compatible = "vendor,board";
    #address-cells = <1>;
    #size-cells = <1>;

    cpus {
        #address-cells = <1>;
        #size-cells = <0>;
        cpu@0 {
            device_type = "cpu";
            compatible = "arm,cortex-a53";
            reg = <0>;
        };
    };
};
```

## See Also

- `sys/arm/` - ARM support