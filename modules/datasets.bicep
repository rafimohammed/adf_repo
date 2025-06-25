param factoryName string
resource BlobStorageLinkedService 'Microsoft.DataFactory/factories/linkedServices@2018-06-01' existing = {
  name: 'BlobStorageLinkedService'
  parent: dataFactory
}

resource dataFactory 'Microsoft.DataFactory/factories@2018-06-01' existing = {
  name: factoryName
}

resource Json_pr_dataset 'Microsoft.DataFactory/factories/datasets@2018-06-01' = {
  name: 'Json_pr_dataset'
  parent: dataFactory
  properties: {
  linkedServiceName: BlobStorageLinkedService
    folder: { name: 'Datasets' }
    annotations: []
    type: 'Json'
    typeProperties: {
      location: {
        type: 'AzureBlobStorageLocation'
        fileName: 'pr.data.0.Current'
        folderPath: 'pr'
        container: 'questblsdata'
      }
    }
    schema: {}
  }
}
resource Json_usa_dataset 'Microsoft.DataFactory/factories/datasets@2018-06-01' = {
  name: 'Json_usa_dataset'
  parent: dataFactory
  properties: {
  linkedServiceName: BlobStorageLinkedService
    folder: { name: 'Datasets' }
    annotations: []
    type: 'Json'
    typeProperties: {
      location: {
        type: 'AzureBlobStorageLocation'
        fileName: 'population.json'
        folderPath: 'datausa'
        container: 'questblsdata'
      }
    }
    schema: {}
  }
}