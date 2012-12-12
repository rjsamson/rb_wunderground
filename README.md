# RbWunderground

A simple wrapper for the Weather Underground API that returns a Hashie::Mash for convenience.

TODO: Write more tests

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

rb_wunderground also supports multiple queries in a single method call - just string together multiple features with '_and_'. For example:

```ruby
w = RbWundergound::Base.new('API_KEY')
# Get forecast and hourly forecast for a zip code
forecast = w.forecast_and_hourly('12186')
# Get hourly forecast and weather yesterday along with current conditions for a US city
forecast = w.hourly_and_yesterday_and_conditions("NY/Albany")
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
