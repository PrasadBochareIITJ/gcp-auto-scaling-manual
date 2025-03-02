# GCP Auto-Scaling Setup (Manual Configuration)

## 1️ Overview
This repository contains the necessary scripts and documentation for setting up **Auto-Scaling in GCP** manually.

---

## 2️ Steps to Create a Managed Instance Group
1. Go to **Google Cloud Console** > **Compute Engine** > **Instance Templates**.
2. Click **Create Instance Template** and configure:
   - **Machine Type**: `e2-medium`
   - **Boot Disk**: `Ubuntu 20.04 LTS`
   - **Firewall**:  Allow HTTP & HTTPS Traffic
   - **Startup Script**: Use `setup_vm.sh`
3. Click **Create**.

---

## 3️ Configure the Auto-Scaling Group
1. Navigate to **Compute Engine** > **Instance Groups**.
2. Click **Create Instance Group** and set:
   - **Type**: Managed
   - **Instance Template**: `auto-scaling-template`
   - **Auto-Scaling**: Enable
   - **Min instances**: 1
   - **Max instances**: 10
   - **CPU Utilization Target**: 60%
3. Click **Create**.

---

## 4️ Configure Firewall Rules
1. Go to **VPC Network** > **Firewall Rules**.
2. Click **Create Rule** and configure:
   - **Allow HTTP (80), HTTPS (443)**
   - **Restrict SSH (22) to specific IPs**
3. Click **Create**.

---

## 5️ Testing Auto-Scaling Behavior
1. SSH into an instance from the **Instance Group**.
2. Install the `stress` tool:
   ```sh
   sudo apt update && sudo apt install stress -y
3. Simulate high CPU load:
   ```sh
    stress --cpu 2 --timeout 300
4. Check Compute Engine > Instance Groups and observe new instances being created.
Stop the test:
   ```sh
    pkill stress
5. Observe instances being removed automatically
