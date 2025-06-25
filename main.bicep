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
