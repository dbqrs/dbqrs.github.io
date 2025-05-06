---
author: rs
title: AllStarLink Install Notes
date: 2025-05-05 02:00:00 -0500 
categories: [radio]
tags: [radio,voip,ham radio,raspberry pi,pi,node]
---


# This is a work in progress and may or may not be updated.




Copy/Pasta from https://community.allstarlink.org/t/the-5-most-popular-reasons-for-connection-failure/22178
## 📡 IAX-Based Registration (ASL3)

This document explains how to use **IAX-based registration** instead of **HTTP-based registration** with ASL3.

---

### ⚠️ Do **Not** Do This "Just Because"

Only switch to IAX-based registration if you're experiencing **known issues** with HTTP registration.

> 🧠 **Important**:
> IAX registration uses **significantly more server resources**. Over **99%** of users **do not need** IAX. Use it **only** if your situation requires it.

---

### ✅ Valid Reasons to Use IAX-Based Registration

Only consider IAX-based registration if:

* 🔒 **Outbound HTTP/HTTPS is blocked**, but UDP ports are open
  *Example*: Your node is behind a proxy, content filter, or firewall that blocks HTTP-based registration.

* 📶 **Carrier-grade NAT or hotspots affect HTTP but not IAX**
  *Example*: Using **AT\&T** or **T-Mobile** hotspots that rewrite HTTP headers. This can cause HTTP registration to fail or misreport IP addresses.

---

### 🔄 Switching to IAX Registration (Step-by-Step)

Follow these steps **as root** (e.g. use `sudo -s`):

---

#### 1. Disable HTTP Registration

Edit `/etc/asterisk/modules.conf`:

```ini
noload => res_rpt_http_registrations.so
```

---

#### 2. Enable IAX Registration

Edit `/etc/asterisk/iax.conf`, and under the `[general]` section, add your registration line (example):

```ini
[general]
register => 63001:VerySecret@register.allstarlink.org
```

---

#### 3. Restart Asterisk

```bash
systemctl restart asterisk
```

---

#### 4. Verify IAX Registration

Run the Asterisk CLI:

```bash
asterisk -r
```

Then run:

```bash
iax2 show registry
```

✅ **Successful Output Example**:

```
node63001*CLI> iax2 show registry
Host                  dnsmgr  Username  Perceived        Refresh  State
34.105.111.212:4569   Y       63001     192.0.2.171:4569 180      Registered
```

If `State` shows **Registered**, you’re all set! 🎉