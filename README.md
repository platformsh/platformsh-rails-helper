# Platform.sh Rails Helper ALPHA RELEASE
platform_sh_rails is a helper gem to ease interacting with the environment of the Platform.sh PaaS on the Ruby on Rails Framework

See the platform_sh gem for vanilla ruby helper

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'platform_sh_rails'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install platform_sh_rails

## Usage

This gem setups the environment for Rails, it will autoconfigure: 

* ActiveRecord
* RabbitMQ (using bunny)
* Redis
* ElasticSearch
* Solr
* Mongodb
* InfluxDB

The gem will autoconfigure rails to use the first service it finds. So if you just add this gem to yout Gemfile  and push everything should work automagically. The configuration works by exporting environment variables with the expected names and URL structure.

If you have multiple services of the same type.. or multiple relational databases (like a postgres + a mysql) in your .platform/services file .. well you should configure by hand.

Also note that for ActiveRecord this will default to mysql2, but if you  loaded the mysql Gem it should still work.


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/platformsh/platform_rb.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

