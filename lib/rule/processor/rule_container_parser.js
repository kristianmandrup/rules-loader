// Generated by LiveScript 1.2.0
(function(){
  var MatchesProcessor, RulesProcessor, RuleContainerParser;
  MatchesProcessor = require('./matches_processor');
  RulesProcessor = require('./rules_processor');
  module.exports = RuleContainerParser = (function(){
    RuleContainerParser.displayName = 'RuleContainerParser';
    var prototype = RuleContainerParser.prototype, constructor = RuleContainerParser;
    function RuleContainerParser(obj){
      this.obj = obj;
      this.matchesClazz = MatchesProcessor;
      this.rulesClazz = RulesProcessor;
    }
    prototype.parseMatches = function(){
      return new this.matchesClazz(this.obj).process();
    };
    prototype.parseRules = function(){
      return new this.rulesClazz(this.obj).process();
    };
    prototype.tryParseRules = function(){
      var e;
      try {
        return this.parseRules();
      } catch (e$) {
        e = e$;
        return this.parseRule();
      }
    };
    prototype.parseRule = function(){
      return new this.rulesClazz(this.obj).process();
    };
    prototype.parse = function(){
      return this.parsedRules = import$(this.parseMatches(), this.tryParseRules());
    };
    return RuleContainerParser;
  }());
  function import$(obj, src){
    var own = {}.hasOwnProperty;
    for (var key in src) if (own.call(src, key)) obj[key] = src[key];
    return obj;
  }
}).call(this);