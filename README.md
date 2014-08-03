# EN

[![Build Status](https://secure.travis-ci.org/rodrigues/en.png?branch=master)](https://travis-ci.org/rodrigues/en)

A simple, namespaceable environment fetcher that supports optionally [dotenv](https://github.com/bkeepers/dotenv)

To get a variable value, do:

```ruby
require 'en'

EN[:key]      # looks for ENV['KEY']
EN[:foo_bar]  # looks for ENV['FOO_BAR']
```

The `#fetch` method can give you more options:

```ruby
require 'en'

EN.fetch(:key) { 'default_value' }

EN.fetch_int(:key)   # fails if value is not a valid Integer
EN.fetch_float(:key) # fails if value is not a valid Float
```

To load variables from a .env file via `dotenv`, do:

```ruby
# .env file
KEY: value

# ruby file
require 'en'

EN.load

EN.fetch(:key)
```

To namespace your keys by a prefix, do:

```ruby
def redis_env
  EN::Namespace.new(:redis)
end

port = redis_env.fetch_int(:port)
```
