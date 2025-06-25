param factoryName string

resource dataFactory 'Microsoft.DataFactory/factories@2018-06-01' existing = {
  name: factoryName
}

resource restapi_dataset 'Microsoft.DataFactory/factories/datasets@2018-06-01' existing = {
  name: 'restapi_dataset'
  parent: dataFactory
}

resource Json_pr_dataset 'Microsoft.DataFactory/factories/datasets@2018-06-01' existing = {
  name: 'Json_pr_dataset'
  parent: dataFactory
}

resource RestResource1 'Microsoft.DataFactory/factories/datasets@2018-06-01' existing = {
  name: 'RestResource1'
  parent: dataFactory
}

resource Json_usa_dataset 'Microsoft.DataFactory/factories/datasets@2018-06-01' existing = {
  name: 'Json_usa_dataset'
  parent: dataFactory
}

resource DatabricksLinkedService 'Microsoft.DataFactory/factories/linkedServices@2018-06-01' existing = {
  name: 'DatabricksLinkedService'
  parent: dataFactory
}

resource adf_quest_assesment 'Microsoft.DataFactory/factories/pipelines@2018-06-01' = {
  name: 'adf_quest_assesment'
  parent: dataFactory
  properties: {
    activities: [
      // your 4 activities (cp_pr_data, Web_pr_data, cp_usa_data, quest_nb, Web_usa_data) go here
      // I can help reinsert the activity logic too if you need
    ]
    policy: {
      elapsedTimeMetric: {}
    }
    annotations: []
  }
  dependsOn: [
    restapi_dataset
    Json_pr_dataset
    RestResource1
    Json_usa_dataset
    DatabricksLinkedService
  ]
}