param factoryName string

resource dataFactory 'Microsoft.DataFactory/factories@2018-06-01' existing = {
  name: factoryName
}

resource BlobStorageLinkedService 'Microsoft.DataFactory/factories/linkedServices@2018-06-01' existing = {
  name: 'BlobStorageLinkedService'
  parent: dataFactory
}

resource RestService1 'Microsoft.DataFactory/factories/linkedServices@2018-06-01' existing = {
  name: 'RestService1'
  parent: dataFactory
}

resource HttpServer_LS 'Microsoft.DataFactory/factories/linkedServices@2018-06-01' existing = {
  name: 'HttpServer_LS'
  parent: dataFactory
}

resource HttpServer_LS_usadata 'Microsoft.DataFactory/factories/linkedServices@2018-06-01' existing = {
  name: 'HttpServer_LS_usadata'
  parent: dataFactory
}

resource Json_pr_dataset 'Microsoft.DataFactory/factories/datasets@2018-06-01' = {
  name: 'Json_pr_dataset'
  parent: dataFactory
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
}

resource Json_usa_dataset 'Microsoft.DataFactory/factories/datasets@2018-06-01' = {
  name: 'Json_usa_dataset'
  parent: dataFactory
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
}

resource RestResource1 'Microsoft.DataFactory/factories/datasets@2018-06-01' = {
  name: 'RestResource1'
  parent: dataFactory
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
}

resource restapi_dataset 'Microsoft.DataFactory/factories/datasets@2018-06-01' = {
  name: 'restapi_dataset'
  parent: dataFactory
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
}

resource restapi_delimited 'Microsoft.DataFactory/factories/datasets@2018-06-01' = {
  name: 'restapi_delimited'
  parent: dataFactory
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
}