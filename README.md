[![Gem Version](https://badge.fury.io/rb/capybara-thruster.svg)](https://rubygems.org/gems/capybara-thruster)
[![Build](https://github.com/evilmartians/capybara-thruster/workflows/Build/badge.svg)](https://github.com/palkan/capybara-thruster/actions)

# Capybara Thruster server

This gem makes it possible to use [Thruster][] as a Capybara server. Run your browser test with HTTP/2 enabled and static assets served via Thruster for faster load times!

> [TIP!]
> Using AnyCable? This gem works with [AnyCable-d Thruster][anycable-thruster], so you can run your system tests against a real AnyCable server with all its features!

## Getting started

Adding the gem to your project:

```ruby
# Gemfile
gem "capybara-thruster", group: :test
```

Then, configure Capybara to use Thruster as a server:

```ruby
Capybara.server = :thruster

# You can also specify some options.

# For example, if you want to see the server output,
# pass the `debug: true` option:
Capybara.server = :thruster, {debug: true}

# To customize the server settings, you can pass arbitrary environment
# variables via the `env` option:
Capybara.server = :thruster, {env: {"DEBUG" => "true"}}

# To specify Puma server options, use the `puma_options` option:
Capybara.server = :thruster, {puma_options: {Silent: false}}
```

## Contributing

Bug reports and pull requests are welcome on GitHub at [https://github.com/evilmartians/capybara-thruster](https://github.com/evilmartians/capybara-thruster).

## Credits

This gem is generated via [`newgem` template](https://github.com/palkan/newgem) by [@palkan](https://github.com/palkan).

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

[Thruster]: https://github.com/basecamp/thruster
[anycable-thruster]: https://github.com/anycable/thruster
