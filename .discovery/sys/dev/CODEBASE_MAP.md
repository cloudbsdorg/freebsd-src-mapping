# sys/dev/ — Device Drivers Codebase Map

**Path:** `sys/dev/`
**Files:** 303 device driver subdirectories
**Purpose:** Device drivers for hardware peripherals

## Overview

The dev/ directory contains device drivers organized by type. Each subdirectory typically implements a specific hardware driver or family.

## Major Driver Categories

### Network Devices (net/)

| Category | Drivers | Description |
|----------|---------|-------------|
| Ethernet | age, ale, alc, amdsmn, bce, bfe, bge, bnxt, cas, cxgbe, em, et, fxg, gem, igc, ixgbe, jme, le, lem, msk, mxge, nfe, ngbe, pcnet, re, rl, sf, sis, sk, ste, stge, ti, txp, udav, vge, vr, xl | Gigabit/10G Ethernet NICs |
| Wireless | ath (ath9k), bwi (bwn), iwn, iwm, malo, malo, mwlu, otus, pci, ral, rtwn, rum, run, uath, ural, urtw, wi, wpi, zyd | 802.11 wireless |
| USB Ethernet | aue, axe, cdce, cue, kue, ue, udav | USB Ethernet adapters |
| Virtual | epair, loop, vlan, wireguard | Virtual network devices |
| Token Ring | fi, tr | Token Ring (legacy) |
| WAN | ai, ci, cn, cs, cy, ed, ep, fe, ie, is, le, ln, ncv, no, np, ns, pc, pp, sf, sg, sl, sn, so, sp, sr, st, sx, tl, tx, wi, z | Serial/WAN |

### Storage Devices (disk/)

| Driver | Description |
|---------|-------------|
| aac, aacraid | RAID controllers |
| ahci | AHCI SATA |
| ata | ATA/IDE |
| cam/ | CAM SCSI subsystem |
| da | SCSI disk (uses CAM) |
| disk | Generic disk |
| fd | Floppy disk |
| ida | Compaq IDA RAID |
| mlx | Mellanox ConnectX |
| mrsas | LSI MegaRAID SAS |
| nvd | NVMe |
| siis | Silicon Image SATA |
| smartpqi | HPE Smart Array |
| twa | 3ware RAID |
| tws | LSI SAS |
| isp | QLogic FC |

### Input Devices

| Driver | Description |
|---------|-------------|
| atkbdc | AT keyboard controller |
| atkbd | AT keyboard |
| psm | PS/2 mouse |
| ukbd | USB keyboard |
| ums | USB mouse |
| kbdmux | Keyboard multiplexer |
| ezload | Tablet (Wacom) |

### USB Drivers

| Driver | Description |
|---------|-------------|
| aue | ASIX USB Ethernet |
| axe | AX88772 USB Ethernet |
| cdce | CDC Ethernet |
| cue | CATC USB Ethernet |
| uaudio | Audio |
| ubser | Serial |
| udbp | Debug port |
| uhid | HID devices |
| ukbd | Keyboard |
| umass | Storage |
| umct | Modem |
| ums | Mouse |
| uplcom | Serial |
| urtwn | Realtek WLAN |
| uslcom | Serial |
| uvscom | Serial |

### Graphics/Display

| Driver | Description |
|---------|-------------|
| drm2, drm | Direct Rendering Manager |
| i915 | Intel graphics |
| amdgpu | AMD GPU |
| radeon | ATI/AMD GPU |
| nouveau | NVIDIA (open) |
| virtio-gpu | Virtual GPU |
| vga | VGA console |
| vt | Virtual terminal |
| fb | Framebuffer |
| splash | Splash screen |

### Audio

| Driver | Description |
|---------|-------------|
| sound | Generic sound |
| ichss | Intel HD Audio |
| uaudi | USB audio |
| cdce | Audio (USB) |

### Crypto/Hardware Acceleration

| Driver | Description |
|---------|-------------|
| aesni | Intel AES-NI |
| ccp | AMD CCP |
| crypto | Cryptographic ops |
| hifn | HiFn crypto |
| padlock | VIA PadLock |
| safe | SafeNet crypto |
| ubsec | Broadcom crypto |

### System Devices

| Driver | Description |
|---------|-------------|
| apic | APIC interrupt controller |
| atrtc | Real-time clock |
| attimer | AT timer |
| clock | Clock handling |
| cpu | CPU device |
| cpufreq | CPU frequency |
| acpi | ACPI |
| pci | PCI bus |
| cardbus | CardBus |
| pccard | PCMCIA |

### GPIO/Pin Control

| Driver | Description |
|---------|-------------|
| gpio | GPIO framework |
| amdgpio | AMD GPIO |
| amdpm | AMD GPIO (SB) |
| ichgpio | Intel GPIO |
| piix4gpio | PIIX4 GPIO |

### Thermal/Monitoring

| Driver | Description |
|---------|-------------|
| amdtemp | AMD temperature |
| coretemp | Intel temperature |
| ichsmb | Intel SMBus |
| smartpqi | RAID smart monitoring |

### Virtualization

| Driver | Description |
|---------|-------------|
| virtio | VirtIO para-virtualization |
| hyperv | Hyper-V |
| vmware | VMware guest tools |
| vmm | VMM (BHyV) |

### Serial/I2C/SPI

| Driver | Description |
|---------|-------------|
| uart | Serial |
| sdhci | SDHCI (SD cards) |
| spi | SPI bus |
| iicbus | I2C bus |
| twsi | I2C (Intel) |

## Device Structure

```c
// Device driver
struct driver {
    const char      *name;           // Driver name
    device_method_t *methods;       // Methods
    size_t          size;           // Softc size
};

// Device softc
struct softc {
    struct device   *dev;           // Device
    // Driver-specific fields
};
```

## Device Access

```c
// Device methods
device_attach(device_t dev);
device_detach(device_t dev);
device_suspend(device_t dev);
device_resume(device_t dev);
device_shutdown(device_t dev);

// Bus access
bus_alloc_resource(device_t dev, int type, int *rid, u_long start, u_long end, u_long count, int flags);
bus_release_resource(device_t dev, int type, int rid, struct resource *r);
bus_read_ivar(device_t dev, int which, u_long *result);
```

## Driver Registration

```c
// Driver declaration
static device_method_t foo_methods[] = {
    DEVMETHOD(device_attach, foo_attach),
    DEVMETHOD(device_detach, foo_detach),
    DEVMETHOD_END
};

static driver_t foo_driver = {
    "foo",
    foo_methods,
    sizeof(struct foo_softc)
};

DRIVER_MODULE(foo, bus, foo_driver, foo_devclass, 0, 0);
```

## sysctl Variables

```
dev.foo.%d.*         - Per-device settings
hw.bus.devices       - Bus devices
hw.pci.enable         - PCI enable
```

## Key Dependencies

```c
#include <sys/device.h>          // Device
#include <sys/bus.h>            // Bus
#include <sys/rman.h>           // Resource management
#include <machine/bus.h>        // Machine-dependent
```

## See Also

- `sys/cam/` - CAM SCSI subsystem
- `sys/geom/` - GEOM framework
- `sys/dev/usb/` - USB stack
- `sys/dev/acpica/` - ACPI