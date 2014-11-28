MatchesProcessor  = require './matches_processor'
RulesProcessor    = require './rules_processor'

module.exports = class RuleContainerParser
  (@obj) ->
    @matches-clazz  = MatchesProcessor
    @rules-clazz    = RulesProcessor

  parse-matches: ->
    new @matches-clazz(@obj).process!

  parse-rules: ->
    new @rules-clazz(@obj).process!

  try-parse-rules: ->
    try
      @parse-rules!
    catch
      @parse-rule!

  parse-rule: ->
    new @rules-clazz(@obj).process!

  parse: ->
    @parsed-rules = @parse-matches! <<< @try-parse-rules!



