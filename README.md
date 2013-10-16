# ReskribeApi

Ruby gem for accesing to Reskribe API

## Installation

Add this line to your application's Gemfile:

    gem 'reskribe_api'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install reskribe_api

## Usage

The Reskribe API requires the api_token

```ruby
ReskribeApi.api_token = "api_token_here"
```

Optional you can override to use ssl or not

```ruby
ReskribeApi.ssl = false
```

Or the end point

```ruby
ReskribeApi.api_base = "anotherReskribeEndPoint"
```

## Commands

### Forms
#### Create a Form
```ruby
ReskribeApi::Form.create("plan_name", "user_id")
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request :)
