// Generated by LiveScript 1.2.0
(function(){
  var expect, index, ActRuleProcessor, processor;
  require('../../test_setup');
  expect = require('chai').expect;
  index = require('../../../');
  ActRuleProcessor = index.processor.ActRuleProcessor;
  processor = function(act, rule){
    return new ActRuleProcessor(act, rule);
  };
  describe('ActRuleProcessor', function(){
    var pr, act, rule;
    before(function(){
      act = 'can';
      return rule = {
        read: 'Article'
      };
    });
    return describe('create', function(){
      context('invalid', function(){
        return specify('throws', function(){
          return expect(function(){
            return processor(act, void 8);
          }).to['throw'];
        });
      });
      return context('valid', function(){
        before(function(){
          return pr = processor(act, rule);
        });
        specify('ok', function(){});
        specify('rules list set empty', function(){
          return pr.rules.should.be.empty;
        });
        describe('process', function(){
          var res;
          before(function(){
            return res = pr.process();
          });
          return specify('should return function', function(){
            return res.should.be.an.instanceOf(Function);
          });
        });
        return describe('resolve(act, action, subject)', function(){
          var res;
          context('can read article', function(){
            before(function(){
              return res = pr.resolve('can', 'read', 'article');
            });
            return specify('returns ucan function', function(){
              return res.should.be.an.instanceOf(Function);
            });
          });
          return context('cannot edit book', function(){
            before(function(){
              return res = pr.resolve('cannot', 'edit', 'book');
            });
            return specify('returns ucannot function', function(){
              return res.should.be.an.instanceOf(Function);
            });
          });
        });
      });
    });
  });
}).call(this);
