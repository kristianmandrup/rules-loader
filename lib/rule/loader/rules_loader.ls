Debugger    = require '../../../util' .Debugger

Array.prototype.contains = (v) ->
  @indexOf(v) > -1

RulesFileLoader = require './rules_file_loader'

module.exports = class RulesLoader implements Debugger
  (@file-path, @options = {}) ->
    @loaded-rules = {}
    @file-loader = new RulesFileLoader @file-path, @loaded-rules-callback, @options

  load: (async) ->
    @file-loader.load-rules async

  loaded-rules-callback: (rules) ->
    @loaded-rules = rules
    @process-rules!

  process-rules: ->
    @debug "processRules", @loaded-rules
    throw Error "Rules not loaded or invalid: #{@loaded-rules}" unless typeof! @loaded-rules is 'Object'
 
    @processed-rules = {}
    for key, rule of @loaded-rules
      @process-rule key, rule

    @rules!

  # integrate with Rule processor!!
  process-rule: (key, rule) ->
     throw Error "Not implemented"

  create-rules-at: (container, key) ->
    unless typeof! container is 'Object'
      throw Error "Not a rule container, was: #{container}"
    if key?
      container[key] = @rules!
    else
      container = @rules!

  rules: ->
    @processed-rules

