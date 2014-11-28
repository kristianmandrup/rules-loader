# Rules loader

Can load and process rules from any JSON source, such as from a JSON file a JSON data store or just a regular
javascript Object transformed to JSON via `JSON.parse(obj)`.

### Status

Needs some finishing touches! Please help out :)

### Rules loader

- `RulesLoader` - abstract base class for loaders
- `RulesDbLoader` - load rules from data store
- `RulesFileLoader` - load rules from JSON file

load rules synchronously

```js
rules-loader = new PermitRulesLoader './rules/my-rules.json'
rules-loader.load-rules!
console.log rules-loader.loaded-rules
```

or asynchronously

```js
loaded-callback = (loaded-rules)
  console.log loaded-rules

rules-loader = new PermitRulesLoader './rules/my-rules.json', loaded-callback
rules-loader.load-rules-async!
```

or asynchronously with callback on a per-instance basis

```js
loaded-callback = (loaded-rules)
  console.log loaded-rules

rules-loader = new PermitRulesLoader './rules/my-rules.json'
rules-loader.load-rules-async loaded-callback
```

### Rules processor

- `MatchesProcessor`      - process `matches` rules

- `ActRuleProcessor`      - process can/cannot rules
- `RuleProcessor`         - process single rule
- `RulesProcessor`        - process list of rules

- `RuleContainerParser`   - process list of rules

Normally you would want to process rules as a "complete package" at the rule container level

```js
ruleParser = new RuleContainerParser(rulesObject)
parsed = ruleParser.parse!

# at any time you have access to the parsed rules on the parser
ruleParser.parsedRules
```

## Contribution

Please help improve this project, suggest improvements, add better tests etc. ;)

## Licence

MIT License
Copyright 2014-2015 Kristian Mandrup

See LICENSE file