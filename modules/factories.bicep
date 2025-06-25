param factoryName string
param BlobStorageLinkedService_properties_typeProperties_serviceEndpoint string
param BlobStorageLinkedService_properties_typeProperties_tenant string
param BlobStorageLinkedService_properties_typeProperties_servicePrincipalId string
@secure()
param BlobStorageLinkedService_servicePrincipalCredential string
param DatabricksLinkedService_accessToken string
param DatabricksLinkedService_properties_typeProperties_existingClusterId string
resource factoryName_BlobStorageLinkedService 'Microsoft.DataFactory/factories/linkedServices@2018-06-01' = {
  name: '${factoryName}/BlobStorageLinkedService'
  properties: {
    annotations: []
    type: 'AzureBlobStorage'
    typeProperties: {
      azureCloudType: 'AzurePublic'
      serviceEndpoint: BlobStorageLinkedService_properties_typeProperties_serviceEndpoint
      tenant: BlobStorageLinkedService_properties_typeProperties_tenant
      servicePrincipalId: BlobStorageLinkedService_properties_typeProperties_servicePrincipalId
      servicePrincipalCredentialType: 'ServicePrincipalKey'
      servicePrincipalCredential: {
        type: 'SecureString'
        value: BlobStorageLinkedService_servicePrincipalCredential
      }
      accountKind: 'StorageV2'
    }
  }
  dependsOn: []
}

resource factoryName_DatabricksLinkedService 'Microsoft.DataFactory/factories/linkedServices@2018-06-01' = {
  name: '${factoryName}/DatabricksLinkedService'
  properties: {
    annotations: []
    type: 'AzureDatabricks'
    typeProperties: {
      domain: 'https://adb-2155193104848284.4.azuredatabricks.net'
      accessToken: {
        type: 'SecureString'
        value: DatabricksLinkedService_accessToken
      }
      existingClusterId: DatabricksLinkedService_properties_typeProperties_existingClusterId
    }
  }
  dependsOn: []
}