# ScienceLogic

## debian_update_check
A solution to check for updates on a Debian host, report the status of updates to ScienceLogic, Dashboards in ScienceLogic to view holistically what needs updates/recently updated, and automation workflows to find out what packages need updates and/or update the packages through ScienceLogic.

No changes necessary to the ansible playbooks or files.

## ubuntu_update_check
A solution to check for updates on an Ubuntu host, report the status of updates to ScienceLogic, Dashboards in ScienceLogic to view holistically what needs updates/recently updated, and automation workflows to find out what packages need updates and/or update the packages through ScienceLogic.

No changes necessary to the ansible playbooks or files.

## discover_amazon
A solution to configure an Amazon OS running in AWS so that it can be discovered via SNMP and so that it will send it's syslogs and traps to ScienceLogic.  It can also automate the discovery inside ScienceLogic by utlizing the SL1 RESTful API with both SNMP and SSH discovery sessions.

### Pre-requisites:
#### You must make several changes to the provided files:
* The playbook rsyslog_amazon_configure.yml file includes a variable for your SL1 Data Collector. Replace "sl1_mc" value to your Data/Message Collector IP or hostname that will receive the syslogs.
```
    vars:
      sl1_mc: "change_me"
```
* The playbook snmp_amazon_configure.yml file includes three variables that will need to be changed. Replace "snmp_ro" value to your snmp read-only value, "sl1_dc" value to your Data Collector IP or hostname that will discover/monitor your servers, and "sl1_mc" value to your Data/Message Collector IP or hostname that will receive the syslogs.
``` vars:
      snmp_ro: "change_me"
      sl1_dc: "change_me"
      sl1_mc: "change_me"
```
* Both playbooks discover_amazon_snmp.yml & discover_amazon_ssh.yml files will need to be changed. Replace "sl1_username" value to the user that has API access to create discovery sessions, "sl1_password" to that users password, and "sl1_url" to the url that you will be accessing the SL1 RESTful API at.
```
    vars:
      sl1_username: "change_me"
      sl1_password: "change_me"
      sl1_url: "https://change_me/api/discovery_session_active"
```
* Lastly, in the default_files folder there are two .json files.  Both files have three lines that you will need to change.
```
{
   "log_all" : "0",
   "organization" : "/api/organization/change_me",      <<<<  Change this to the org_id that the new device(s) will be aligned to
   "model_override" : "0",
   "model_device" : "1",
   "credentials" : [
      "/api/credential/snmp/change_me"                  <<<< Change this line 
   ],                                                        For SNMP json file = the SNMP credendial id
   "edited_by" : "/api/account/change_me",                   For SSH json file = the SSH credential GUID
   "max_interface_inventory_count" : "10000",
   "aligned_device_template" : null,
   "bypass_interface_inventory" : "0",
   "device_groups" : [],
   "port_scan_timeout" : null,
   "ip_lists" : [
      {
         "start_ip" : "MY_ADDRESS",
         "end_ip" : "MY_ADDRESS"
      }
   ],
   "scan_all_ips" : null,
   "discover_non_snmp" : "0",
   "hostnames" : [],
   "pre_device_ttl" : "2",
   "scan_throttle" : null,
   "interface_inventory_timeout" : "600000",
   "name" : "ansible_created_MY_ADDRESS",
   "scan_ports" : [
      "21",
      "22",
      "25",
      "80",
      "136"
   ],
   "duplicate_protection" : "1",
   "description" : "",
   "dhcp_enabled" : "0",
   "aligned_collector" : "/api/appliance/change_me",      <<<< Change this line to the collector_id that will do the discovery
   "initial_scan_level" : null
}
```
## discover_centos
A solution to configure an CentOS operating systems running in Amazon so that it can be discovered via SNMP and so that it will send it's syslogs and traps to ScienceLogic.  It can also automate the discovery inside ScienceLogic by utlizing the SL1 RESTful API with both SNMP and SSH discovery sessions.

### Pre-requisites:
#### You must make several changes to the provided files:
* The playbook rsyslog_centos_configure.yml file includes a variable for your SL1 Data Collector. Replace "sl1_mc" value to your Data/Message Collector IP or hostname that will receive the syslogs.
```
    vars:
      sl1_mc: "change_me"
```
* The playbook snmp_centos_configure.yml file includes three variables that will need to be changed. Replace "snmp_ro" value to your snmp read-only value, "sl1_dc" value to your Data Collector IP or hostname that will discover/monitor your servers, and "sl1_mc" value to your Data/Message Collector IP or hostname that will receive the syslogs.
``` vars:
      snmp_ro: "change_me"
      sl1_dc: "change_me"
      sl1_mc: "change_me"
```
* Both playbooks discover_centos_snmp.yml & discover_centos_ssh.yml files will need to be changed. Replace "sl1_username" value to the user that has API access to create discovery sessions, "sl1_password" to that users password, and "sl1_url" to the url that you will be accessing the SL1 RESTful API at.
```
    vars:
      sl1_username: "change_me"
      sl1_password: "change_me"
      sl1_url: "https://change_me/api/discovery_session_active"
```
* Lastly, in the default_files folder there are two .json files.  Both files have three lines that you will need to change.
```
{
   "log_all" : "0",
   "organization" : "/api/organization/change_me",      <<<<  Change this to the org_id that the new device(s) will be aligned to
   "model_override" : "0",
   "model_device" : "1",
   "credentials" : [
      "/api/credential/snmp/change_me"                  <<<< Change this line 
   ],                                                        For SNMP json file = the SNMP credendial id
   "edited_by" : "/api/account/change_me",                   For SSH json file = the SSH credential GUID
   "max_interface_inventory_count" : "10000",
   "aligned_device_template" : null,
   "bypass_interface_inventory" : "0",
   "device_groups" : [],
   "port_scan_timeout" : null,
   "ip_lists" : [
      {
         "start_ip" : "MY_ADDRESS",
         "end_ip" : "MY_ADDRESS"
      }
   ],
   "scan_all_ips" : null,
   "discover_non_snmp" : "0",
   "hostnames" : [],
   "pre_device_ttl" : "2",
   "scan_throttle" : null,
   "interface_inventory_timeout" : "600000",
   "name" : "ansible_created_MY_ADDRESS",
   "scan_ports" : [
      "21",
      "22",
      "25",
      "80",
      "136"
   ],
   "duplicate_protection" : "1",
   "description" : "",
   "dhcp_enabled" : "0",
   "aligned_collector" : "/api/appliance/change_me",      <<<< Change this line to the collector_id that will do the discovery
   "initial_scan_level" : null
}
```
## discover_debian
A solution to configure an Debian operating systems running in Amazon so that it can be discovered via SNMP and so that it will send it's syslogs and traps to ScienceLogic.  It can also automate the discovery inside ScienceLogic by utlizing the SL1 RESTful API with both SNMP and SSH discovery sessions.

### Pre-requisites:
#### You must make several changes to the provided files:
* The playbook rsyslog_debian_configure.yml file includes a variable for your SL1 Data Collector. Replace "sl1_mc" value to your Data/Message Collector IP or hostname that will receive the syslogs.
```
    vars:
      sl1_mc: "change_me"
```
* The playbook snmp_debian_configure.yml file includes three variables that will need to be changed. Replace "snmp_ro" value to your snmp read-only value, "sl1_dc" value to your Data Collector IP or hostname that will discover/monitor your servers, and "sl1_mc" value to your Data/Message Collector IP or hostname that will receive the syslogs.
``` vars:
      snmp_ro: "change_me"
      sl1_dc: "change_me"
      sl1_mc: "change_me"
```
* Both playbooks discover_debian_snmp.yml & discover_debian_ssh.yml files will need to be changed. Replace "sl1_username" value to the user that has API access to create discovery sessions, "sl1_password" to that users password, and "sl1_url" to the url that you will be accessing the SL1 RESTful API at.
```
    vars:
      sl1_username: "change_me"
      sl1_password: "change_me"
      sl1_url: "https://change_me/api/discovery_session_active"
```
* Lastly, in the default_files folder there are two .json files.  Both files have three lines that you will need to change.
```
{
   "log_all" : "0",
   "organization" : "/api/organization/change_me",      <<<<  Change this to the org_id that the new device(s) will be aligned to
   "model_override" : "0",
   "model_device" : "1",
   "credentials" : [
      "/api/credential/snmp/change_me"                  <<<< Change this line 
   ],                                                        For SNMP json file = the SNMP credendial id
   "edited_by" : "/api/account/change_me",                   For SSH json file = the SSH credential GUID
   "max_interface_inventory_count" : "10000",
   "aligned_device_template" : null,
   "bypass_interface_inventory" : "0",
   "device_groups" : [],
   "port_scan_timeout" : null,
   "ip_lists" : [
      {
         "start_ip" : "MY_ADDRESS",
         "end_ip" : "MY_ADDRESS"
      }
   ],
   "scan_all_ips" : null,
   "discover_non_snmp" : "0",
   "hostnames" : [],
   "pre_device_ttl" : "2",
   "scan_throttle" : null,
   "interface_inventory_timeout" : "600000",
   "name" : "ansible_created_MY_ADDRESS",
   "scan_ports" : [
      "21",
      "22",
      "25",
      "80",
      "136"
   ],
   "duplicate_protection" : "1",
   "description" : "",
   "dhcp_enabled" : "0",
   "aligned_collector" : "/api/appliance/change_me",      <<<< Change this line to the collector_id that will do the discovery
   "initial_scan_level" : null
}
```
## discover ubuntu
A solution to configure an Ubuntu operating systems running in Amazon so that it can be discovered via SNMP and so that it will send it's syslogs and traps to ScienceLogic.  It can also automate the discovery inside ScienceLogic by utlizing the SL1 RESTful API with both SNMP and SSH discovery sessions.

### Pre-requisites:
#### You must make several changes to the provided files:
* The playbook rsyslog_ubuntu_configure.yml file includes a variable for your SL1 Data Collector. Replace "sl1_mc" value to your Data/Message Collector IP or hostname that will receive the syslogs.
```
    vars:
      sl1_mc: "change_me"
```
* The playbook snmp_ubuntu_configure.yml file includes three variables that will need to be changed. Replace "snmp_ro" value to your snmp read-only value, "sl1_dc" value to your Data Collector IP or hostname that will discover/monitor your servers, and "sl1_mc" value to your Data/Message Collector IP or hostname that will receive the syslogs.
``` vars:
      snmp_ro: "change_me"
      sl1_dc: "change_me"
      sl1_mc: "change_me"
```
* Both playbooks discover_ubuntu_snmp.yml & discover_ubuntu_ssh.yml files will need to be changed. Replace "sl1_username" value to the user that has API access to create discovery sessions, "sl1_password" to that users password, and "sl1_url" to the url that you will be accessing the SL1 RESTful API at.
```
    vars:
      sl1_username: "change_me"
      sl1_password: "change_me"
      sl1_url: "https://change_me/api/discovery_session_active"
```
* Lastly, in the default_files folder there are two .json files.  Both files have three lines that you will need to change.
```
{
   "log_all" : "0",
   "organization" : "/api/organization/change_me",      <<<<  Change this to the org_id that the new device(s) will be aligned to
   "model_override" : "0",
   "model_device" : "1",
   "credentials" : [
      "/api/credential/snmp/change_me"                  <<<< Change this line 
   ],                                                        For SNMP json file = the SNMP credendial id
   "edited_by" : "/api/account/change_me",                   For SSH json file = the SSH credential GUID
   "max_interface_inventory_count" : "10000",
   "aligned_device_template" : null,
   "bypass_interface_inventory" : "0",
   "device_groups" : [],
   "port_scan_timeout" : null,
   "ip_lists" : [
      {
         "start_ip" : "MY_ADDRESS",
         "end_ip" : "MY_ADDRESS"
      }
   ],
   "scan_all_ips" : null,
   "discover_non_snmp" : "0",
   "hostnames" : [],
   "pre_device_ttl" : "2",
   "scan_throttle" : null,
   "interface_inventory_timeout" : "600000",
   "name" : "ansible_created_MY_ADDRESS",
   "scan_ports" : [
      "21",
      "22",
      "25",
      "80",
      "136"
   ],
   "duplicate_protection" : "1",
   "description" : "",
   "dhcp_enabled" : "0",
   "aligned_collector" : "/api/appliance/change_me",      <<<< Change this line to the collector_id that will do the discovery
   "initial_scan_level" : null
}
```
