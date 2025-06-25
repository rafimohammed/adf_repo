param factoryName string
param HttpServer_LS_properties_typeProperties_url string
param HttpServer_LS_usadata_properties_typeProperties_url string
param RestService1_properties_typeProperties_url string
param restresource1_properties_typeProperties_url string

resource factoryName_HttpServer_LS 'Microsoft.DataFactory/factories/linkedServices@2018-06-01' = {
  name: '${factoryName}/HttpServer_LS'
  properties: {
    annotations: []
    type: 'HttpServer'
    typeProperties: {
      url: HttpServer_LS_properties_typeProperties_url
      enableServerCertificateValidation: true
      authenticationType: 'Anonymous'
    }
  }
  dependsOn: []
}

resource factoryName_HttpServer_LS_usadata 'Microsoft.DataFactory/factories/linkedServices@2018-06-01' = {
  name: '${factoryName}/HttpServer_LS_usadata'
  properties: {
    annotations: []
    type: 'HttpServer'
    typeProperties: {
      url: HttpServer_LS_usadata_properties_typeProperties_url
      enableServerCertificateValidation: true
      authenticationType: 'Anonymous'
    }
  }
  dependsOn: []
}

resource factoryName_RestService1 'Microsoft.DataFactory/factories/linkedServices@2018-06-01' = {
  name: '${factoryName}/RestService1'
  properties: {
    annotations: []
    type: 'RestService'
    typeProperties: {
      url: RestService1_properties_typeProperties_url
      enableServerCertificateValidation: true
      authenticationType: 'Anonymous'
    }
  }
  dependsOn: []
}
resource restresource1 'Microsoft.DataFactory/factories/linkedServices@2018-06-01' = {
  name: '${factoryName}/restresource1'
  properties: {
    annotations: []
    type: 'RestService'
    typeProperties: {
      url: restresource1_properties_typeProperties_url
      authenticationType: 'Anonymous'
    }
  }
  dependsOn: []
}