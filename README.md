# RbWunderground

A simple wrapper for the Weather Underground API that returns a Hashie::Mash for convenience.

TODO: Write more tests, add ability to search multiple features in one query.

## Installation

Add this line to your application's Gemfile:

    gem 'rb_wunderground'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rb_wunderground

## Usage
To get started, create a new instance of RbWunderground::Base with your Weather Underground API key.

```ruby
w = RbWundergound::Base.new('API_KEY')
```

The following is available through the Weather Underground's JSON API:

```
alerts
almanac
astronomy
conditions
currenthurricaine
forecast
forecast10day
geolookup
history_YYYMMDD
hourly
hourly10day
planner_MMDDMMDD
rawtide
tide
webcams
yesterday
```

These queries are available as methods with a location passed to each in a format accepted by Weather Underground and return a Hashie::Mash of the JSON results.

```ruby
w = RbWundergound::Base.new('API_KEY')
# Location by Zip Code
forecast = w.forecast('12207')
# Location by US State and City
forecast = w.forecast('NY/Albany')
# Location by Country and City
forecast = w.forecast('England/London')
# Location by airport code
forecast = w.forecast('KALB')
# Historical info for a date
history = w.history('12207')

```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
