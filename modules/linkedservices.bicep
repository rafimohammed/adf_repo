param factoryName string
param HttpServer_LS_properties_typeProperties_url string
param HttpServer_LS_usadata_properties_typeProperties_url string
param RestService1_properties_typeProperties_url string
param restresource1_properties_typeProperties_url string

resource dataFactory 'Microsoft.DataFactory/factories@2018-06-01' existing = {
  name: factoryName
}

resource HttpServer_LS 'Microsoft.DataFactory/factories/linkedServices@2018-06-01' = {
  name: 'HttpServer_LS'
  parent: dataFactory
  properties: {
    annotations: []
    type: 'HttpServer'
    typeProperties: {
      url: HttpServer_LS_properties_typeProperties_url
      enableServerCertificateValidation: true
      authenticationType: 'Anonymous'
    }
  }
}

resource HttpServer_LS_usadata 'Microsoft.DataFactory/factories/linkedServices@2018-06-01' = {
  name: 'HttpServer_LS_usadata'
  parent: dataFactory
  properties: {
    annotations: []
    type: 'HttpServer'
    typeProperties: {
      url: HttpServer_LS_usadata_properties_typeProperties_url
      enableServerCertificateValidation: true
      authenticationType: 'Anonymous'
    }
  }
}

resource RestService1 'Microsoft.DataFactory/factories/linkedServices@2018-06-01' = {
  name: 'RestService1'
  parent: dataFactory
  properties: {
    annotations: []
    type: 'RestService'
    typeProperties: {
      url: RestService1_properties_typeProperties_url
      enableServerCertificateValidation: true
      authenticationType: 'Anonymous'
    }
  }
}

resource restresource1 'Microsoft.DataFactory/factories/linkedServices@2018-06-01' = {
  name: 'restresource1'
  parent: dataFactory
  properties: {
    annotations: []
    type: 'RestService'
    typeProperties: {
      url: restresource1_properties_typeProperties_url
      authenticationType: 'Anonymous'
    }
  }
}
resource BlobStorageLinkedService 'Microsoft.DataFactory/factories/linkedServices@2018-06-01' = {
  name: 'BlobStorageLinkedService'
  parent: dataFactory
  properties: {
    type: 'AzureBlobStorage'
    typeProperties: {
      connectionString: '<REPLACE_WITH_SECURE_REFERENCE>'
    }
    annotations: []
  }
}