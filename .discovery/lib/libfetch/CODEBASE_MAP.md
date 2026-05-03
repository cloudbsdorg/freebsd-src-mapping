# lib/libfetch/ — URL Fetch Library Codebase Map

**Path:** `lib/libfetch/`
**Purpose:** URL fetching library

## Overview

libfetch provides URL fetching for HTTP, HTTPS, FTP, and file:// URLs.

## Key Files

| File | Purpose |
|------|---------|
| `fetch.h` | Main header |
| `common.c` | Common code |
| `fetch.c` | Main fetch |
| `http.c` | HTTP |
| `ftp.c` | FTP |
| `file.c` | File URLs |

## Fetch Functions

```c
// Simple fetch
struct url *fetch_parse_url(const char *URL);
void fetch_free_url(struct url *u);

struct url_stat {
    off_t size;
    time_t atime;
    time_t mtime;
};

// HTTP specific
int fetch_http(struct url *u, struct url_stat *us, const char *flags);
int fetch_ftp(struct url *u, struct url_stat *us, const char *flags);
int fetch_file(struct url *u, struct url_stat *us, const char *flags);
```

## IO Functions

```c
// With timeout
FILE *fetchXGet(struct url *, struct url_stat *, const char *flags, ...);
FILE *fetchGet(struct url *, struct url_stat *, const char *flags);
FILE *fetchPut(struct url *, const char *flags);

// With callback
int fetchCat(struct url *, FILE *);
```

## URL Structure

```c
struct url {
    char *scheme;      // http, ftp, file
    char *host;        // hostname
    int port;          // port number
    char *user;        // username
    char *pwd;         // password
    char *doc;         // document path
    struct url *vars;  // query variables
};
```

## See Also

- `usr.bin/ftp/` - FTP client
- `usr.bin/fetch/` - fetch utility