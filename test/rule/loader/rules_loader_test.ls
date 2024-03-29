require '../../test_setup'
expect = require 'chai' .expect

index = require '../../../'

RulesFileLoader = index.loader.RulesFileLoader

describe 'Permit' ->
  var rules-loader, loaded-rules, file-path, basic-rules-file-path
  permits = {}

  describe 'rules loader' ->
    before-each ->
      rules-loader := new RulesFileLoader
      basic-rules-file-path := './test/rules/basic-rules.json'

    # clean up!
    after-each ->
      PermitRegistry.clear-all!

    context 'bad file path' ->
      specify 'file load error' ->
        expect(-> rules-loader.load-rules 'rules.json', false).to.throw new Error

        specify 'sets file path' ->
          rules-loader.load-rules 'rules.json', false
          expect(rules-loader.file-path).to.eq void

    context 'good file path'  ->
      specify 'loads rules' ->
        expect(-> rules-loader.load-rules basic-rules-file-path).to.not.throw Error

      context 'loaded' ->
        before-each ->
          # rules-loader.debug-on!
          rules-loader.load-rules basic-rules-file-path, false

        specify 'sets file path' ->
          expect(rules-loader.file-path).to.equal basic-rules-file-path

        specify 'has loaded rules' ->
          # console.log rules-loader
          expect(rules-loader.loaded-rules).to.not.be.empty

        specify 'has loaded editor rules' ->
          expect(rules-loader.loaded-rules).to.eql(editor: { can: { edit: 'book', publish: 'paper' } } )

        specify 'has processed rules' ->
          # console.log rules-loader.processed-rules
          expect(rules-loader.processed-rules).to.not.be.empty

        specify 'has processed rules editor - Function' ->
          # console.log 'editor', rules-loader.processed-rules.editor
          expect(rules-loader.processed-rules.editor).to.be.a 'function'
