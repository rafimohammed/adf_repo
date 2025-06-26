# 🏗️ Azure Data Factory + Databricks IaC Deployment

This project automates the full deployment of an Azure Data Factory pipeline integrated with a Databricks notebook using GitHub Actions,
Bicep, and Databricks CLI.

### 🔧 Key Features
- Modular **Bicep architecture** for ADF, datasets, linked services, and pipelines
- GitHub Actions CI/CD pipeline that deploys ADF resources and uploads Databricks notebooks
- **Secure secret handling** via Azure Key Vault and Databricks secret scopes
- Production-ready setup with scheduling and parameterized deployment support
- Infrastructure-as-Code from ADF pipeline to Databricks execution — fully reproducible

### 💼 Technologies
Azure Data Factory · Bicep · GitHub Actions · Databricks · Key Vault · CI/CD · Python · IaC

## 📁 Repository Structure
adf_repo/
├── main.bicep
├── modules/
│   ├── linkedservices.bicep
│   ├── datasets.bicep
│   └── pipelines.bicep
├── .github/
│   └── workflows/
│       └── deploy.yml
├── README.md
├── parameter-samples/
│   └── dev.parameters.json
└── .gitignore



## ⚙️ Deployment Details

The workflow deploys to Azure on every push to the `main` branch. The pipeline:
1. Authenticates using a GitHub Secret `AZURE_CREDENTIALS` (Service Principal JSON)
2. Deploys all ADF resources defined in Bicep templates
3. Passes secrets (e.g., `BLOB_CONN_STRING`) securely at runtime

## 🔐 Required GitHub Secrets

| Name                     | Purpose                                |
|--------------------------|----------------------------------------|
| `AZURE_CREDENTIALS`      | Azure service principal (JSON format)  |
| `BLOB_CONN_STRING`       | Blob Storage connection string         |

## 🚀 Manual Deployment (Optional)

If you'd like to test locally using Azure CLI:

```bash
az deployment group create \
  --resource-group rg-blobstorage \
  --template-file main.bicep \
  --parameters factoryName=azure-quest \
               BlobStorageLinkedService_conn='<your-connection-string>'
			   

🧪 Validation Checklist
- ✅ ADF factory named azure-quest exists
- ✅ Linked services, datasets, and pipeline deployed without errors
- ✅ GitHub Actions triggered automatically on code change
- ✅ Secrets handled securely

For repository code, you can visit https://github.com/rafimohammed/adf_repo