_ = require 'underscore'
ObjectID = require('mongodb').ObjectID

# @attributes go in the DB!
# @all_others live in memory only!
# use @set if you want it to be persisted

class Model
    
    constructor: (attributes) ->
        @attributes = {}
        for k, v of attributes
          if k is "_id"
            v = new ObjectID(v)
          @set k, v
        @initialize() if @initialize
    
    isValid: () ->
      return true
    
    # the docs object callback to collection.insert attributes, options, callback is:
    # ops Array.<object>  # All the documents inserted with their new _id values if forceServerObjectId == false.
    # connection  object  # The connection object used for the operation.
    # result  object  # The command result object.
    
    save: (db, c) ->
      await
        db.collection(@collectionName).insertOne @attributes, {safe: true}, defer err, writeOpResult
      console.error @collectionName + ".insertOne misbehaved " + writeOpResult.result if writeOpResult.result.ok isnt 1 or writeOpResult.result.n isnt 1 or writeOpResult.ops.length isnt 1
      c err if err
      return c null, writeOpResult.ops[0]

    update: (db, c) ->
      await
        db.collection(@collectionName).updateOne {_id : ObjectID(@get '_id')}, @attributes, {upsert : true}, defer err, writeOpResult
      console.error @collectionName + " updateOne misbehaved, " + writeOpResult.result if writeOpResult.result.ok isnt 1 or writeOpResult.result.n isnt 1
      c err if err
      return c()

    set: (k, v) ->
      if (typeof k) == 'object'
        for k2, v2 of k
          @set k2, v2
        return
      v = v.toISOString() if v instanceof Date
      @id = v if k == 'id'
      @attributes[k] = v

    get: (k) -> @attributes[k]

    get_date: (k) -> new Date @attributes[k]

    toJSON: () ->
      @attributes.id = @id
      @attributes

module.exports = {Model}
