param factoryName string = 'azure-quest'

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

module datasets 'modules/datasets.bicep' = {
  name: 'datasets'
  params: {
    factoryName: factoryName
  }
}
module pipelines 'modules/pipelines.bicep' = {
  name: 'pipelines'
  params: {
    factoryName: factoryName
  }
}