---
author: rs
title: Configure DC DNS Forwarders
date: 2025-1-12 02:00:00 -0500 
categories: [domain controller]
tags: [DC,domain,dns]
---

### To have your domain controller's DNS forward internet activity to a custom DNS controller, you'll want to configure DNS forwarding on the domain controller. Here's how to do it:

1. **Open the DNS Manager**:
   - On the domain controller, open the "Server Manager" and go to "Tools" > "DNS."
   
2. **Configure Forwarders**:
   - In DNS Manager, expand your server and right-click on **Forwarders**.
   - Select **Properties**.
   - In the **Forwarders** tab, click **Edit**.
   - Add the IP address of your custom DNS controller.
   - Click **OK** to apply the changes.
