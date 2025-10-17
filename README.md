# GitHub Action Demo - Spring Boot CI/CD Pipeline

[![Spring Boot](https://img.shields.io/badge/Spring%20Boot-4.0.0--SNAPSHOT-brightgreen.svg)](https://spring.io/projects/spring-boot)
[![Java](https://img.shields.io/badge/Java-17-orange.svg)](https://www.oracle.com/java/)
[![Gradle](https://img.shields.io/badge/Gradle-8.0-blue.svg)](https://gradle.org/)
[![Azure](https://img.shields.io/badge/Azure-Container%20Apps-0078D4.svg)](https://azure.microsoft.com/)
[![CI/CD](https://img.shields.io/badge/CI%2FCD-GitHub%20Actions-2088FF.svg)](https://github.com/features/actions)

A Spring Boot REST API application demonstrating **automated CI/CD pipeline** with GitHub Actions that automatically
builds, containerizes, and deploys to Azure Container Apps on every commit to the main branch.

## 🔄 CI/CD Pipeline Overview

This project implements a **fully automated CI/CD pipeline** using GitHub Actions that triggers on every push to the
`main` branch. The pipeline automatically:

1. ✅ Checks out the latest code
2. 🔐 Authenticates with Azure
3. 🏗️ Builds a Docker image from the application
4. 📤 Pushes the image to Azure Container Registry
5. 🚀 Deploys the updated container to Azure Container Apps
6. ✨ Makes the application live instantly

### Pipeline Flow Diagram

```
┌─────────────────┐
│  Push to Main   │
│     Branch      │
└────────┬────────┘
         │
         ▼
┌─────────────────┐
│ GitHub Actions  │
│    Triggered    │
└────────┬────────┘
         │
         ▼
┌─────────────────┐
│  Build Docker   │
│     Image       │
└────────┬────────┘
         │
         ▼
┌─────────────────┐
│   Push to ACR   │
│  (cidemo.azure  │
│   cr.io)        │
└────────┬────────┘
         │
         ▼
┌─────────────────┐
│ Deploy to Azure │
│ Container Apps  │
└────────┬────────┘
         │
         ▼
┌─────────────────┐
│  Application    │
│     Live! 🎉    │
└─────────────────┘
```

## 💡 How It Works

### Automatic Deployment Process

When you commit and push changes to the `main` branch:

```bash
git add .
git commit -m "Your changes"
git push origin main
```

The GitHub Actions workflow (`.github/workflows/deploy.yaml`) automatically:

- **Builds** the application using the multi-stage Dockerfile
- **Authenticates** with Azure using service principal credentials
- **Logs in** to Azure Container Registry (`cidemo.azurecr.io`)
- **Tags** the Docker image as `cidemo.azurecr.io/gad:latest`
- **Pushes** the image to the private Azure Container Registry
- **Updates** the Azure Container App (`ci-demo-container`) with the new image
- **Deploys** the application to production in the `Meet` resource group

**No manual intervention required!** ⚡

## ✨ Features

- **🚀 Automated CI/CD Pipeline** - Automatic deployment to Azure on every main branch commit
- **☁️ Azure Container Apps Deployment** - Serverless container hosting with automatic scaling
- **🐳 Azure Container Registry** - Private Docker image registry integration
- **🔄 Continuous Deployment** - Build → Push → Deploy workflow fully automated
- **🌐 RESTful API** - Clean REST endpoints for user management
- **📦 Multi-Stage Docker Build** - Optimized container images for production
- **📖 OpenAPI Documentation** - Interactive API documentation with Swagger UI
- **⚡ Spring Boot 4.0** - Latest Spring Boot snapshot version

## 🛠 Technology Stack

### Application

- **Framework**: Spring Boot 4.0.0-SNAPSHOT
- **Language**: Java 17
- **Build Tool**: Gradle 8.0
- **API Documentation**: SpringDoc OpenAPI 2.8.13

### DevOps & Cloud

- **CI/CD**: GitHub Actions
- **Container Registry**: Azure Container Registry (ACR)
- **Hosting**: Azure Container Apps
- **Containerization**: Docker (Multi-stage build)
- **Base Image**: Eclipse Temurin JRE 17 Alpine

## ☁️ Azure Infrastructure

This application is deployed on Azure using the following resources:

| Resource               | Name                           | Purpose                          |
|------------------------|--------------------------------|----------------------------------|
| **Resource Group**     | `Meet`                         | Contains all Azure resources     |
| **Container Registry** | `cidemo.azurecr.io`            | Private Docker image repository  |
| **Container App**      | `ci-demo-container`            | Runs the Spring Boot application |
| **Image**              | `cidemo.azurecr.io/gad:latest` | Latest Docker image of the app   |

### Architecture Diagram

```
GitHub Repository (main branch)
         │
         │ Push triggers
         ▼
    GitHub Actions
         │
         │ Builds & Pushes
         ▼
Azure Container Registry
    (cidemo.azurecr.io)
         │
         │ Pulls image
         ▼
  Azure Container Apps
   (ci-demo-container)
         │
         │ Serves traffic
         ▼
    End Users 🌍
```

## 📦 Prerequisites

Before running this application, ensure you have the following installed:

- **Java Development Kit (JDK)** 17 or higher
- **Gradle** 8.0 or higher (or use the included Gradle wrapper)
- **Docker** (optional, for containerized deployment)
- **Git** (for cloning the repository)

## 🚀 Getting Started

### Clone the Repository

```bash
git clone https://github.com/Meet-08/github_action_demo.git
cd github_action_demo
```

### Running Locally

#### Using Gradle Wrapper (Recommended)

**On Windows (PowerShell):**

```powershell
.\gradlew.bat bootRun
```

**On Linux/macOS:**

```bash
./gradlew bootRun
```

#### Using Gradle Directly

```bash
gradle bootRun
```

The application will start on **http://localhost:80**

### Building the Application

**Build JAR file:**

```powershell
.\gradlew.bat clean build
```

**Run the generated JAR:**

```powershell
java -jar build/libs/githubActionDemo-0.0.1-SNAPSHOT.jar
```

## 📁 Project Structure

```
githubActionDemo/
├── src/
│   ├── main/
│   │   ├── java/com/meet/githubactiondemo/
│   │   │   ├── controller/
│   │   │   │   ├── TestController.java      # Test endpoint controller
│   │   │   │   └── UserController.java      # User management controller
│   │   │   ├── models/
│   │   │   │   └── User.java                # User model
│   │   │   ├── service/
│   │   │   │   └── UserService.java         # User business logic
│   │   │   └── GithubActionDemoApplication.java  # Main application
│   │   └── resources/
│   │       └── application.properties        # Application configuration
│   └── test/
│       └── java/com/meet/githubactiondemo/
│           └── GithubActionDemoApplicationTests.java
├── build.gradle                              # Gradle build configuration
├── Dockerfile                                # Docker container definition
├── gradlew & gradlew.bat                     # Gradle wrapper scripts
└── README.md                                 # This file
```

## 🔌 API Endpoints

### Base URL

```
http://localhost:80
```

### Available Endpoints

| Method | Endpoint         | Description           | Response                     |
|--------|------------------|-----------------------|------------------------------|
| GET    | `/test`          | Health check endpoint | Returns "Hello World!"       |
| GET    | `/get-all-users` | Retrieve all users    | Returns list of User objects |

### Example Responses

#### GET /test

```
Hello World!
```

#### GET /get-all-users

```json
[
  {
    "name": "User1",
    "email": "user1@example.com"
  },
  {
    "name": "User2",
    "email": "user2@example.com"
  },
  ...
]
```

## ⚙️ Setting Up CI/CD

### Prerequisites for CI/CD

1. **Azure Account** with an active subscription
2. **Azure Container Registry** (ACR) created
3. **Azure Container App** created
4. **Azure Service Principal** with appropriate permissions
5. **GitHub Repository** with admin access

### Step 1: Create Azure Resources

```bash
# Create resource group
az group create --name groupName

# Create Azure Container Registry
az acr create --name registryName --resource-group groupName --sku Basic

# Create Azure Container App
az containerapp create \
  --name containerAppName \
  --resource-group groupName \
  --image registryName.azurecr.io/gad:latest \
  --target-port 80 \
  --ingress external
```

### Step 2: Create Service Principal

```bash
# Create service principal and get credentials
az ad sp create-for-rbac --name "github-actions-sp" \
  --role contributor \
  --scopes /subscriptions/{subscription-id}/resourceGroups/Meet \
  --sdk-auth
```

Copy the entire JSON output - you'll need it for GitHub Secrets.

### Step 3: Configure GitHub Secrets

In your GitHub repository, go to **Settings → Secrets and variables → Actions** and add:

| Secret Name         | Value                                                  |
|---------------------|--------------------------------------------------------|
| `AZURE_CREDENTIALS` | The entire JSON output from service principal creation |

### Step 4: Workflow Configuration

The workflow file is located at `.github/workflows/deploy.yaml`:

```yaml
name: actions example
on:
  push:
    branches:
      - main

permissions:
  id-token: write
  contents: read

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout repository
        uses: actions/checkout@v4

      - name: Log in to Azure
        uses: azure/login@v2
        with:
          creds: ${{secrets.AZURE_CREDENTIALS}}

      - name: Build Docker image
        run: |
          docker build -t gad:latest .

      - name: Log in to Azure Container Registry
        run: |
          az acr login --name cidemo

      - name: Tag & Push to ACR
        run: |
          docker tag gad:latest cidemo.azurecr.io/gad:latest
          docker push cidemo.azurecr.io/gad:latest

      - name: Deploy to Azure Container Apps
        uses: azure/cli@v2
        with:
          inlineScript: |
            az containerapp update --name ci-demo-container --resource-group Meet --image cidemo.azurecr.io/gad:latest
```

### Step 5: Trigger Deployment

Simply push to main branch:

```bash
git add .
git commit -m "Deploy to Azure"
git push origin main
```

Watch the deployment in the **Actions** tab of your GitHub repository! 🚀

## 🐳 Docker Support

### Local Docker Testing

Build and test the Docker image locally before pushing:

```bash
# Build the image
docker build -t gad:latest .

# Run the container
docker run -p 80:80 gad:latest
```

The application will be accessible at **http://localhost:80**

### Docker Multi-Stage Build

This project uses an optimized multi-stage Docker build:

1. **Build Stage**: Uses Gradle 8.0 to compile and package the application
2. **Runtime Stage**: Uses Eclipse Temurin JRE 17 Alpine for a minimal production image

This approach reduces the final image size and improves security by excluding build tools from production.

## 📖 API Documentation

This application includes **SpringDoc OpenAPI** for interactive API documentation.

### Accessing Swagger UI

Once the application is running, navigate to:

```
http://localhost:80/swagger-ui.html
```

### OpenAPI JSON

View the raw OpenAPI specification:

```
http://localhost:80/v3/api-docs
```

## ⚙️ Configuration

### Application Properties

Located in `src/main/resources/application.properties`:

```properties
spring.application.name=githubActionDemo
server.port=80
```

### Key Configurations

- **Application Name**: `githubActionDemo`
- **Server Port**: `80`
- **Default Users**: 10 pre-populated users (User1-User10)

### Customization

To change the server port, modify `application.properties`:

```properties
server.port=8080
```

## 🐛 Troubleshooting

### Common Issues

#### 1. **Authentication Failed**

**Error**: `Error: Login failed with Error: Unable to login`

**Solution**:

- Verify `AZURE_CREDENTIALS` secret is correctly configured
- Ensure service principal has correct permissions
- Check if service principal is expired

#### 2. **Docker Push Failed**

**Error**: `denied: requested access to the resource is denied`

**Solution**:

```bash
# Assign ACR push role to service principal
az role assignment create --assignee <service-principal-id> \
  --role AcrPush \
  --scope /subscriptions/{subscription-id}/resourceGroups/Meet/providers/Microsoft.ContainerRegistry/registries/cidemo
```

#### 3. **Container App Update Failed**

**Error**: `ContainerAppOperationError`

**Solution**:

- Verify container app name and resource group are correct
- Check if the image exists in ACR
- Ensure the container app is running

#### 4. **Application Not Accessible**

**Problem**: Cannot access the deployed application

**Solution**:

```bash
# Ensure ingress is enabled
az containerapp ingress enable --name ci-demo-container --resource-group Meet --target-port 80 --type external

# Get the application URL
az containerapp show --name ci-demo-container --resource-group Meet --query properties.configuration.ingress.fqdn -o tsv
```

### Logs and Debugging

**View GitHub Actions logs:**

- Go to Actions tab → Select workflow run → View job logs

**View Azure Container App logs:**

```bash
az containerapp logs show --name ci-demo-container --resource-group Meet --follow
```

**View Azure Container Registry images:**

```bash
az acr repository list --name cidemo --output table
az acr repository show-tags --name cidemo --repository gad --output table
```

## 🎯 Key Takeaways

This project demonstrates:

✅ **Zero-downtime deployments** - Azure Container Apps handles rolling updates automatically
✅ **Infrastructure as Code** - All infrastructure can be provisioned via Azure CLI
✅ **GitOps workflow** - Git is the single source of truth
✅ **Automated testing** - Can be extended to include automated tests before deployment
✅ **Scalability** - Azure Container Apps automatically scales based on demand
✅ **Cost-effective** - Pay only for what you use with container apps

## 📚 Additional Resources

- [Azure Container Apps Documentation](https://learn.microsoft.com/en-us/azure/container-apps/)
- [GitHub Actions Documentation](https://docs.github.com/en/actions)
- [Spring Boot Documentation](https://spring.io/projects/spring-boot)
- [Azure Container Registry Documentation](https://learn.microsoft.com/en-us/azure/container-registry/)

## 👤 Author

**Meet Patel**

- GitHub: [@Meet-08](https://github.com/Meet-08)
- Repository: [github_action_demo](https://github.com/Meet-08/github_action_demo)

## 🙏 Acknowledgments

- **Microsoft Azure** for Container Apps and Container Registry services
- **GitHub** for Actions CI/CD platform
- **Spring Boot** team for the excellent framework
- **SpringDoc** for OpenAPI integration
- **Docker** for containerization support

---

## 🚀 Quick Start Summary

```bash
# 1. Clone the repository
git clone https://github.com/Meet-08/github_action_demo.git
cd github_action_demo

# 2. Make your changes
# Edit files as needed

# 3. Commit and push to main
git add .
git commit -m "Your changes"
git push origin main

# 4. Watch the magic happen! ✨
# GitHub Actions automatically builds and deploys to Azure
# Check the Actions tab for deployment status
```

---

**Happy Deploying! 🚀☁️**

If you find this CI/CD pipeline helpful, please give it a ⭐️!
