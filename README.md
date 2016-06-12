# ActiveLoader

[![Gem Version](https://badge.fury.io/rb/active_loader.svg)](https://badge.fury.io/rb/active_loader)
[![Build Status](https://travis-ci.org/JuanitoFatas/active_loader.svg?branch=master)](https://travis-ci.org/JuanitoFatas/active_loader)

Load YAML and JSON easily and safely with Active Loader.

## Installation

Add this line to your application's Gemfile:

```ruby
gem "active_loader"
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install active_loader

## Usage

```ruby
yaml_content = IO.read("./.travis.yml")
json_content = IO.read("spec/fixtures/github/users/juanitofatas.json")

# Load YAML content
ActiveLoader.load yaml_content, type: :yaml

# Load JSON content
ActiveLoader.load json_content, type: :json

# Use convenient methods
ActiveLoader.yaml yaml_content
ActiveLoader.json json_content

# Can also pass in URL
ActiveLoader.yaml "https://raw.githubusercontent.com/JuanitoFatas/active_loader/master/.travis.yml"
ActiveLoader.json "https://api.github.com/repos/juanitofatas/active_loader"

# Can also pass in file path
ActiveLoader.yaml "./.travis.yml"
ActiveLoader.json "spec/fixtures/github/users/juanitofatas.json"
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/hack` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/JuanitoFatas/active_loader.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

