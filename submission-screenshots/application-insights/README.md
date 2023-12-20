# Application Insights Screenshots

Please the required screenshots for Application Insights in this directory.

---

Added by E. Schildner

## How to create the resources for Application Insights

Note: az cli extension `app-insights` is required.

```bash
export AZURE_RESOURCE_GROUP=nd081-project-04-azure-performance
export AZURE_LOCATION=westeurope

# New way: Workspace-based Application Insights (old way to be deprecated by Feb 2024)
# First create a Log Analytics Workspace.
az monitor log-analytics workspace create \
    -g $AZURE_RESOURCE_GROUP \
    --workspace-name log-analytics-ws-es81

# Then create the Application Insights resource and link it to the Log Analytics Workspace.
az monitor app-insights component create \
    --app application-insights-es81 \
    -g $AZURE_RESOURCE_GROUP \
    --location $AZURE_LOCATION \
    --kind web \
    --application-type web \
    --workspace log-analytics-ws-es81 \
    --tags "Project=nd081-c4-azure-performance-project"

# Then application insights has the property "Instrumentation Key" which is needed for the web app.
# E.g.: InstrumentationKey=a2f9d6ad-4db7-4d17-b39b-c44a2ca711b6
```

Log in to respective VMs.

```bash
ssh -p 50000 udacityadmin@20.16.235.135
ssh -p 50001 udacityadmin@20.16.235.135
```

```bash
# Install python3
sudo apt-get install python3.11
git clone https://github.com/schildner/udacity-nd081-project4-enhancing-applications.git
cd udacity-nd081-project4-enhancing-applications/azure-vote
pip install -r requirements.txt

# Make sure redis-server is installed and redis-server is running
sudo apt-get install redis
sudo /etc/init.d/redis-server status

# Start the app
python3 main.py
```

The app is now supposed to be running on public IP of the VMSS: 20.16.235.135
