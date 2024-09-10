---
author: rs
title: Change Request Documentation
date: 2024-09-07 02:00:00 -0500 
categories: [support]
tags: [change, procedure, planning, management]
---

A **Change Request** is a detailed, step-by-step guide used in IT projects to ensure that network, server, or other infrastructure changes are implemented smoothly, with minimal disruption and risk. Below are some key elements and examples of what a good Change Request for IT projects should include:

---

### **1. Project Overview**
   - **Purpose**: Why the change is being made.
   - **Scope**: Systems, services, and departments impacted by the change.
   - **Approval**: Who has approved the change (including change control board or manager approval).
   - **Planned Start and End Dates/Times**.

   **Example**:
   > **Purpose**: Upgrade the network switch firmware to address security vulnerabilities and improve performance.
   >
   > **Scope**: This change will impact Switch A (Data Center Core), affecting VLAN 10, 20, and 30. During the upgrade, there will be a temporary network outage in the following segments: Corporate LAN, Guest Wi-Fi, and VOIP services.

---

### **2. Pre-Change Checklist**
   - **Prerequisites**: Any requirements before starting, such as backup completion or preliminary tests.
   - **Documentation**: Ensure all documentation is up-to-date, including network diagrams, configurations, etc.
   - **Notification**: List of departments/teams to be notified before the change.

   **Example**:
   > - All configurations are backed up to the secure NAS: `/backups/core_switch/2024-09-07`.
   > - Ensure all team members have reviewed the firmware release notes.
   > - Notify affected teams (IT Operations, Corporate Services) 24 hours before the scheduled downtime.
   
---

### **3. Roles and Responsibilities**
   - **Team Lead**: Name of the person responsible for the overall change.
   - **Implementers**: Individuals responsible for executing the steps.
   - **Communication Lead**: Person responsible for updating stakeholders during and after the change.

   **Example**:
   > - **Team Lead**: John Doe, Network Engineer
   > - **Implementers**: Alice Smith (Switch Configuration), Bob Johnson (Monitoring)
   > - **Communication Lead**: Sarah Wilson (Updates to leadership and IT department)

---

### **4. Detailed Step-by-Step Procedure**
   - List each task in chronological order.
   - Include precise commands or GUI actions for each step.
   - Mention estimated time for each step and who is responsible.

   **Example**:
   1. **Disable Port Monitoring** (Alice Smith, 5 mins)
      - Run: `no monitor session 1`
   2. **Verify Current Switch Firmware Version** (Bob Johnson, 3 mins)
      - Run: `show version`
   3. **Upload New Firmware** (Alice Smith, 10 mins)
      - Upload: `copy tftp://192.168.1.1/new-firmware.bin flash:`
   4. **Install Firmware** (Alice Smith, 20 mins)
      - Run: `install add file flash:new-firmware.bin activate commit`
   5. **Reboot Switch** (John Doe, 10 mins)
      - Run: `reload`
   6. **Post-Reboot Checks** (Bob Johnson, 15 mins)
      - Verify services (ping test, VLAN connectivity, etc.)
   
---

### **5. Rollback Plan**
   - Clear instructions on how to revert the changes if the procedure fails.
   - Define criteria for when to initiate the rollback.

   **Example**:
   > **Rollback Trigger**: If services are down for more than 30 minutes post-upgrade.
   >
   > - Reboot switch into old firmware using backup image: `boot flash:old-firmware.bin`
   > - Restore configuration from the NAS backup: `/backups/core_switch/2024-09-07/config.txt`
   > - Notify team lead if rollback is initiated.

---

### **6. Post-Change Validation and Monitoring**
   - Specify checks that need to be performed after the change to confirm successful implementation.
   - Assign monitoring responsibilities for any post-change issues.

   **Example**:
   > - Check switch logs for errors: `show log`
   > - Verify VLAN routing is operational: Test with ping between VLAN 10, 20, and 30.
   > - Monitor network traffic for 24 hours to detect any anomalies.
   
---

### **7. Communication and Reporting**
   - Specify who needs to be informed when the change is complete and whether any issues were encountered.
   - Provide a final report on the success or failure of the change.

   **Example**:
   > - Notify stakeholders that the change was successful via email.
   > - Report any anomalies to the IT manager within 1 hour post-implementation.

---

### **8. Contingency Planning**
   - List any backup or emergency procedures if the change fails and the rollback is not possible.

   **Example**:
   > - In case of network failure, escalate to Network Operations for further troubleshooting.
   > - Use backup switches and reroute traffic through Switch B if Switch A does not come back online.

---

By using this structure, IT teams can ensure consistency, minimize risk, and handle unexpected issues efficiently during network or server changes.