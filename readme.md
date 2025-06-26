# Azure Data Factory Deployment via Bicep 🚀

This project automates the deployment of an Azure Data Factory (ADF) instance using Bicep templates and GitHub Actions. 
It includes modular templates for datasets, pipelines, and linked services — all infrastructure-as-code and version-controlled.

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