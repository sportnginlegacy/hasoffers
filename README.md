# HasOffers

[![TravisCI](https://secure.travis-ci.org/sportngin/hasoffers.png "Build Status")](http://travis-ci.org/sportngin/hasoffers "Travis-CI HasOffers")

This gem hooks into the HasOffers API as documented here: http://www.hasoffers.com/wiki/Category:API

# :warning: No longer suported :warning:

This repository is no longer supported by SportNgin.

# Install

gem install hasoffers


# Usage

Add a `has_offers.yml` file to your `$RAILS_ROOT/config/` directory following the format outlined in the gems `config/has_offers.yml` file and change the credentials accordingly.

Example usage: (more examples in tests)
```ruby
response = HasOffers::Offer.create('name' => 'Test',
                                   'description' => 'Test',
                                   'advertiser_id' => '1',
                                   'offer_url' => 'test',
                                   'preview_url' => 'test',
                                   'protocol' => 'https',
                                   'status' => 'active',
                                   'expiration_date' => (Date.today + 30).to_s)
```

When running in development mode, by default live api calls are not made. Dummy responses are returned from the DummyResponse class. Set the `HAS_OFFERS_LIVE` environment variable to "1" to make live api calls when in development mode like so:

```
Rails 2.x: env HAS_OFFERS_LIVE=1 script/server
Rails 3.x: env HAS_OFFERS_LIVE=1 rails server
```

If you always want live api calls in development mode then you can add this line within the `config.after_initialize` block of your development.rb file:

```
config.after_initialize do
  HasOffers::Base.api_mode = :live
end
```

# Tests

The tests can be ran in two modes:

## Test mode
* rake test
Does not make live API calls. Dummy responses are returned by the DummyResponse class which is also used in development mode to avoid live API calls.

## Live mode
```bash
env HAS_OFFERS_LIVE=1 rake test
```
Makes live api calls. Uses the HasOffer credentials in `config/has_offers.yml` which by default is set to the demo account credentials. HasOffers does not supply a test gateway so be careful to not run these tests against your live HasOffers account.


# Contributing

The HasOffers API is huge and this gem implements only a portion of what is available with their API. With this framework in place it should be easy to extend the gem for API calls that are not yet supported. Please send contributions as git patches to luke.ludwig@tstmedia.com, or alternatively create a fork and send a git pull request via github.   
