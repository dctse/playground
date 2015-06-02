assert = require 'assert'
request = require 'request'
app = require '../../../app'

server = app.listen app.get('port'), ->
  console.log 'Express server listening on port %d in mode %s .', server.address().port, app.settings.env


# this is a comment

describe "authentication", ->
  describe "GET /login ", ->
    body = null
    foo = 'foo'
    bar = 'bar'
    before (done) ->
      options =
        uri: "http://localhost:#{app.settings.port}/login"
      console.log options.uri
      request options, (err, response, _body) ->
        body = _body
        done()
    it "has title", ->
      assert.ok body, '//head/title', 'Hot Pie - Login'
    it "has user field", ->
      assert.ok /user/.test(body)
    it "has user tag title tag inside head tag for a html document field", ->
      assert.hasTag body, '//head/title', 'Hot Pie - Login'
    it "simple test of assert truthy 1", ->
      assert 'foo'!='bar', 'foo is not bar'
    it "simple test of assert truthy 2", ->
      assert Array.isArray([]), 'empty arrays are arrays'
    it "simple test of assert.ok truthy 1", ->
      assert.ok 'everything', 'everything is ok'
    it "simple test of assert.ok include match truthy 2", ->
      assert.ok true, 'false is not OK'
      # assert.include 'foobar', 'bar', 'foobar contains string "bar"'
      # assert.include [ 1, 2, 3 ], 3, 'array contains value'
      assert.match 'foobar', /^foo/, 'regexp matches'
      assert.match 'a very long list', /list$/, 'end of list matches'