# aws-scalable-webapp

# Highly Available AWS Web Architecture (NLB + ASG)

##What is this project?
This is a cloud infrastructure mini-project demonstrating how to build a highly scalable, fault-tolerant web application using Amazon Web Services (AWS). 

Instead of relying on a single server that could crash under heavy traffic, this architecture automatically adds or removes servers based on real-time user demand, ensuring the application stays fast and available.

##  Architecture & AWS Services Used
* **Amazon EC2 (Elastic Compute Cloud):** Used to host the Nginx web servers on Ubuntu.
* **Launch Templates:** Stored the server blueprint, including a startup Bash script (User Data) to automatically install and configure Nginx upon boot.
* **Auto Scaling Group (ASG):** Configured to monitor Average CPU Utilization. If the CPU crosses 50%, the ASG automatically spins up new EC2 instances to handle the load.
* **Network Load Balancer (NLB):** Operates at Layer 4 (TCP) to instantly distribute incoming internet traffic across the healthy servers with ultra-low latency. 

##  How it Works
1. A user visits the public DNS link of the Network Load Balancer.
2. The NLB checks the Target Group for healthy EC2 instances.
3. Traffic is seamlessly routed to an available server.
4. If traffic spikes and CPU usage increases, the Auto Scaling Group launches up to 4 total instances.
5. Once traffic dies down, the ASG terminates unneeded instances to save costs.

##  Repository Contents
* `server-setup.sh` - The automated deployment script used in the EC2 Launch Template to install the web server.
