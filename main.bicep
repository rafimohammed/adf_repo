param factoryName string = 'azure-quest'

resource dataFactory 'Microsoft.DataFactory/factories@2018-06-01' existing = {
  name: factoryName
}

// Deploy datasets
module datasets 'modules/datasets.bicep' = {
  name: 'datasets'
  params: {
    factoryName: factoryName
  }
}

// Deploy linked services
module linkedservices 'modules/linkedservices.bicep' = {
  name: 'linkedservices'
  params: {
    factoryName: factoryName
    HttpServer_LS_properties_typeProperties_url: '<REPLACE>'
    HttpServer_LS_usadata_properties_typeProperties_url: '<REPLACE>'
    RestService1_properties_typeProperties_url: '<REPLACE>'
    restresource1_properties_typeProperties_url: '<REPLACE>'
  }
}

// Deploy pipelines
module pipelines 'modules/pipelines.bicep' = {
  name: 'pipelines'
  params: {
    factoryName: factoryName
  }
}
