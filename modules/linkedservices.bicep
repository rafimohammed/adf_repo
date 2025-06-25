param HttpServer_LS_properties_typeProperties_url string
param HttpServer_LS_usadata_properties_typeProperties_url string
param RestService1_properties_typeProperties_url string
param restresource1_properties_typeProperties_url string

param DatabricksLinkedService_accessToken string
param BlobStorageLinkedService_properties_typeProperties_serviceEndpoint string = 'https://practicemyazure.blob.core.windows.net/'
param BlobStorageLinkedService_properties_typeProperties_tenant string = '6962d6a2-3230-476b-b5b0-b6378932bd82'
param BlobStorageLinkedService_properties_typeProperties_servicePrincipalId string = '8ce3aeb0-2880-41fd-b2e4-4b35a2811d95'
param DatabricksLinkedService_properties_typeProperties_existingClusterId string = '0618-172337-8rh3cvy1'

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