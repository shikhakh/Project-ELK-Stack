# Project-ELK-Stack

## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

![ELK stack diagram](Images/ELK-stack-diagram.png)



These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the playbook file may be used to install only certain pieces of it, such as Filebeat.

### Playbook Files

  -	ELK Install
  - DVWA
  - FileBeat
  -	MetricBeat

This document contains the following details:
- Description of the Topology
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly reliable and available, in addition to restricting access to the network.
Load Balancing plays an important security role as computing moves evermore to the cloud. The off-loading function of a load balancer defends an organization against distributed denial-of-service (DDoS) attacks. It does this by shifting attack traffic from the corporate server to a public cloud provider.

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the logfiles and system data.
Filebeat monitors the log files or locations that you specify, collects log events, and forwards them either to Elasticsearch or Logstash for indexing.
Metricbeat helps you monitor your servers by collecting metrics from the system and services running on the server, such as: Apache.

The configuration details of each machine may be found below.


| Name     | Function | IP Address | Operating System |
|----------|----------|------------|------------------|
| Jump Box | Gateway  |10.2.0.4   | Linux            |
| WEB1     |    Web Server      |   10.2.0.5         |  Ubuntu Linux            |
| WEB2     |    Web Server     |     10.2.0.6       |   Ubuntu Linux 
| ELK     |   Elastic search stack       |   10.3.0.4         |   Ubuntu Linux           |

### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the Jump Box virtual machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:
[local workstation public IP address]

Machines within the network can only be accessed by Jump Box
Public IP - 20.211.95.158
Pvt IP - 10.2.0.5 

A summary of the access policies in place can be found in the table below.

| Name     | Publicly Accessible | Allowed IP Addresses |
|----------|---------------------|----------------------|
| Jump Box | SSH Yes |     |local workstation public IP address
|  WEB1  & 2     |   No                  |      *                 |
|   ELK      |   Kibana - Yes           |                                                         *             |

### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because...
Benefits of automation
The first benefit of all of this is saving time.
Before automation, system administrators had to spend hours configuring machines manually, after Ansible, the time required to configure the whole process is less than 3 minutes.

The second benefit is reducing bugs and errors.
When you work manually, errors may occur due to a variety of reasons, but when things are automated, of course you will consider these errors and catch them in your script, after that, errors should disappear.

Infrastructure as Code
This is one of the considered reasons to implement automation. Imagine your whole infrastructure is written in a single script


The playbook implements the following tasks:
Install docker.io
Install python3-pip
Install docker module
Use more memory
Download and launch an elk docker container
Enable service docker on boot


The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

![docker ps](Images/docker-ps.png)



### Target Machines & Beats
This ELK server is configured to monitor the following machines:
WEB1 - 10.2.0.5 
WEB2 - 10.2.0.6
ELK VM - 10.3.0.4

We have installed the following Beats on these machines:
Filebeat and Metricbeat on WEB1, WEB2 and ELK

These Beats allow us to collect the following information from each machine:
Filebeat monitors the log files or locations that you specify, collects log events, and forwards them either to Elasticsearch or Logstash for indexing.
Metricbeat helps you monitor your servers by collecting metrics from the system and services running on the server, such as: Apache.

### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the install-elk.yml file to /etc/ansible/roles/install-elk.yml.
- Update the hosts file to include IP of the ELK and webservers.
- Run the playbook, and navigate to http://[your_elk_server_ip]:5601/app/kibana to check that the installation worked as expected.


- _Which file is the playbook? Where do you copy it?
Playbooks are the files where Ansible code is written. Playbooks are written in YAML format. YAML stands for Yet Another Markup Language. Playbooks are one of the core features of Ansible and tell Ansible what to execute. They are copied in the ansible directory.


- _Which file do you update to make Ansible run the playbook on a specific machine? 
Hosts

How do I specify which machine to install the ELK server on versus which to install Filebeat on?

By updating the config files
- http://[your_elk_server_ip]:5601/app/kibana

_As a **Bonus**, provide the specific commands the user will need to run to download the playbook, update the files, etc._
https://gist.githubusercontent.com/slape/5cc350109583af6cbe577bbcc0710c93/raw/eca603b72586fbe148c11f9c87bf96a63cb25760/Filebeat > /etc/ansible/filebeat-config.yml
