

exports.statistician = class statistician
  constructor : ({dataSet}) ->
    if not dataSet
      console.log "CANNOT ALLOCATE statistician without DataSet"
    