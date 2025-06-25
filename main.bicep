param location string
param factoryName string = 'azure-quest'

@secure()
param BlobStorageLinkedService_servicePrincipalCredential string

var factoryId = 'Microsoft.DataFactory/factories/${factoryName}'

// Deploy datasets
module datasets 'modules/datasets.bicep' = {
  name: 'datasets'
  params: {
    factoryName: factoryName
    location: location
    factoryId: factoryId
  }
}

// Deploy linked services
module linkedservices 'modules/linkedservices.bicep' = {
  name: 'linkedservices'
  params: {
    factoryName: factoryName
    location: location
    factoryId: factoryId
    DatabricksLinkedService_accessToken: '<REPLACE>'
    HttpServer_LS_properties_typeProperties_url: '<REPLACE>'
    HttpServer_LS_usadata_properties_typeProperties_url: '<REPLACE>'
    RestService1_properties_typeProperties_url: '<REPLACE>'
    restresource1_properties_typeProperties_url: '<REPLACE>'
    BlobStorageLinkedService_properties_typeProperties_serviceEndpoint: '<REPLACE>'
    BlobStorageLinkedService_properties_typeProperties_tenant: '<REPLACE>'
    BlobStorageLinkedService_properties_typeProperties_servicePrincipalId: '<REPLACE>'
    DatabricksLinkedService_properties_typeProperties_existingClusterId: '<REPLACE>'
    BlobStorageLinkedService_servicePrincipalCredential: BlobStorageLinkedService_servicePrincipalCredential
  }
}

// Deploy pipelines
module pipelines 'modules/pipelines.bicep' = {
  name: 'pipelines'
  params: {
    factoryName: factoryName
    location: location
    factoryId: factoryId
  }
}
