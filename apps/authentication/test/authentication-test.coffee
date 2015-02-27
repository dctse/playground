
assert  = require 'assert'
request = require 'request'
app     = require '../../../app'

describe "authentication", ->
  describe "GET /login ", ->
    body = null
    before (done) ->
      options =
        uri: "http://localhost:3000/login"
      console.log options.uri
      request options, (err, response, _body) ->
        body = _body
        done()
    it "has title", ->
      assert.ok body, '//head/title', 'Hot Pie - Login'
    it "has user", ->
      assert.ok /user/.test(body)