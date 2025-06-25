param HttpServer_LS_properties_typeProperties_url string = 'https://download.bls.gov/pub/time.series/pr/pr.data.0.Current'
param HttpServer_LS_usadata_properties_typeProperties_url string = 'https://datausa.io/api/'
param RestService1_properties_typeProperties_url string = 'https://datausa.io/api'
param restresource1_properties_typeProperties_url string = 'https://download.bls.gov/pub/time.series/pr/'


resource factoryName_Json_pr_dataset 'Microsoft.DataFactory/factories/datasets@2018-06-01' = {
  name: '${factoryName}/Json_pr_dataset'
  properties: {
    linkedServiceName: {
      referenceName: 'BlobStorageLinkedService'
      type: 'LinkedServiceReference'
    }
    folder: {
      name: 'Datasets'
    }
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
  dependsOn: [
    'BlobStorageLinkedService'
  ]
}

resource factoryName_Json_usa_dataset 'Microsoft.DataFactory/factories/datasets@2018-06-01' = {
  name: '${factoryName}/Json_usa_dataset'
  properties: {
    linkedServiceName: {
      referenceName: 'BlobStorageLinkedService'
      type: 'LinkedServiceReference'
    }
    folder: {
      name: 'Datasets'
    }
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
  dependsOn: [
    'BlobStorageLinkedService'
  ]
}

resource factoryName_RestResource1 'Microsoft.DataFactory/factories/datasets@2018-06-01' = {
  name: '${factoryName}/RestResource1'
  properties: {
    linkedServiceName: {
      referenceName: 'RestService1'
      type: 'LinkedServiceReference'
    }
    annotations: []
    type: 'RestResource'
    typeProperties: {
      relativeUrl: 'data?drilldowns=Nation&measures=Population'
    }
    schema: []
  }
  dependsOn: [
    'RestService1'
  ]
}

resource factoryName_restapi_dataset 'Microsoft.DataFactory/factories/datasets@2018-06-01' = {
  name: '${factoryName}/restapi_dataset'
  properties: {
    linkedServiceName: {
      referenceName: 'HttpServer_LS'
      type: 'LinkedServiceReference'
    }
    annotations: []
    type: 'DelimitedText'
    typeProperties: {
      location: {
        type: 'HttpServerLocation'
      }
      columnDelimiter: '\t'
      rowDelimiter: '\n'
      escapeChar: '\\'
      firstRowAsHeader: false
      quoteChar: '"'
    }
    schema: []
  }
  dependsOn: [
    'HttpServer_LS'
  ]
}

resource factoryName_restapi_delimited 'Microsoft.DataFactory/factories/datasets@2018-06-01' = {
  name: '${factoryName}/restapi_delimited'
  properties: {
    linkedServiceName: {
      referenceName: 'HttpServer_LS_usadata'
      type: 'LinkedServiceReference'
    }
    annotations: []
    type: 'DelimitedText'
    typeProperties: {
      location: {
        type: 'HttpServerLocation'
      }
      columnDelimiter: ','
      escapeChar: '\\'
      firstRowAsHeader: true
      quoteChar: '"'
    }
    schema: []
  }
  dependsOn: [
    'HttpServer_LS_usadata'
  ]
}