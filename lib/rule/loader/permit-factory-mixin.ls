module.exports =
  create-permit: (name, options = {}) ->
    permit-clazz ||= options.clazz or require('permit')
    # console.log 'loaded-rules', loaded-rules, @file-path
    permit = new permit-clazz name, (->
      rules: {}
    )
    loaded-rules = @load-rules!.rules!
    if options.key then permit.rules[key] = loaded-rules else permit.rules = loaded-rules
