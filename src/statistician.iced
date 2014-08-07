

exports.statistician = class statistician
  constructor : ({dataSet}) ->
    if not dataSet
      console.error "Cannot allocate statistician without DataSet"
