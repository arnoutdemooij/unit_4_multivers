# Unit4Multivers

Work in progress: Gem handling the REST API on https://api.online.unit4.nl/V14 with OAuth2 https://api.online.unit4.nl/V14

## Installation

Add this line to your application's Gemfile:

    gem 'unit_4_multivers'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install unit_4_multivers

## Usage

Initialize a new client with consumer_key and consumer_secret

    client = Unit4Multivers::Client.new(consumer_key: CONSUMER_KEY, consumer_secret: CONSUMER_SECRET)

Request a token url and redirect the user to the api for approval

    client.request_token_url

Request an access token based on the code you received from unit 4 multivers

    client.request_access_token(code)

Make requests with the client when authenticated:
    client.administrations

If you need to call a url that isn't covered by the gem's methods, make a custom request:

    client.custom_request(uri, opts = {})


    client.custom_request("/AdministrationNVL")


## Contributing

1. Fork it ( https://github.com/[my-github-username]/unit_4_multivers/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
