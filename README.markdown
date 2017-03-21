# Sabayon Middleware

Simple Rack middleware for use with [Sabayon](https://github.com/dmathieu/sabayon).

You'll still need to use Sabayon to handle the letsencrypt integration, this middleware is just providing the side of things for your Rack-based app in a re-usable fashion.

## Installation and Usage

Add this line to your application's Gemfile:

```ruby
gem "sabayon_middleware"
```

If you're using Rails, the middleware will automatically be added to your stack. Otherwise, you'll want to insert `SabayonMiddleware::Middleware` manually to your app.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/pat/sabayon_middleware. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
