Simple Monitoring Dashboard with Netdata

Project Overview

This project sets up a basic system monitoring dashboard using Netdata on a Linux server. It monitors system performance metrics in real time, including CPU usage, memory consumption, and disk activity.

The project also includes shell scripts to automate installation, generate CPU load for testing, and uninstall Netdata.

Project Reference: roadmap.sh — Simple Monitoring Dashboard

Technologies Used

Linux (Ubuntu)

Netdata

Bash Shell Scripting

AWS EC2

Nginx (optional, for hosting a custom dashboard)

Git and GitHub

Project Structure

netdata-monitoring/
├── README.md
├── setup.sh
├── test_dashboard.sh
└── cleanup.sh

Features

Real-time CPU monitoring

Memory usage monitoring

Disk I/O monitoring

Web-based monitoring dashboard

Custom dashboard displaying selected system metrics

CPU load testing

Automated installation and cleanup scripts

Installation

Clone the repository or copy the project files to your Linux server.

Make the scripts executable:

chmod +x setup.sh test_dashboard.sh cleanup.sh

Run the installation script:

./setup.sh

The script checks whether Netdata is installed. If it is not installed, it downloads and runs the Netdata kickstart installer using the stable release channel.

Accessing the Dashboard

Open the following URL in your browser, replacing the IP address with your server's public IP address:

http://YOUR_SERVER_PUBLIC_IP:19999/

Ensure that TCP port 19999 is allowed in your AWS EC2 security group. For security, restrict access to your own IP address or a trusted network.

Testing the Dashboard

Run the test script:

./test_dashboard.sh

The script generates CPU load for a limited period so that changes can be observed on the Netdata CPU charts.

For example, this command generates CPU load for 30 seconds:

timeout 30s yes > /dev/null

Open the Netdata dashboard while the command is running and observe the CPU utilization chart.

Dashboard Customization

A separate HTML dashboard can be created to display selected Netdata charts, such as CPU and memory usage.

The Netdata charts API can be used to identify available chart IDs:

curl -s http://localhost:19999/api/v1/charts

This allows selected charts to be displayed in a custom monitoring page without signing in to Netdata Cloud.

Alerts

Netdata supports health monitoring and alert rules for system metrics. A CPU utilization threshold can be configured to trigger an alert when usage exceeds 80%.

Refer to the official documentation for configuring and testing alert rules:

Netdata Health Monitoring and Alerts

Cleanup

To uninstall Netdata and remove the monitoring components, run:

./cleanup.sh

Review the cleanup script before execution because it removes Netdata and its configuration files. It should only be run when you intend to uninstall the monitoring agent.

Useful Commands

Check the service status:

sudo systemctl status netdata

Check whether the dashboard responds locally:

curl -I http://localhost:19999/

Check whether Netdata is listening on port 19999:

sudo ss -lntp | grep ':19999'

Learning Outcomes

Installing and managing a Linux monitoring agent

Understanding CPU, memory, and disk performance metrics

Accessing a web-based monitoring dashboard

Customizing monitoring views

Creating and testing monitoring alerts

Automating administration tasks with Bash scripts

References

https://roadmap.sh/projects/simple-monitoring-dashboard
