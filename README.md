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

    client.request_token_url(redirect_uri: 'http://127.0.0.1:3000/oauth2/unit_4/callback/')

Request an access token based on the code you received from unit 4 multivers

    client.request_access_token(code, redirect_uri: 'http://127.0.0.1:3000/oauth2/unit_4/callback/')

Make requests with the client when authenticated:

    client.administrations

Current supported methods:

    :account_info_list,
    :account_manager,
    :account_manager_nvl,
    :account_nvl,
    :account_nvl_with_project_accounts,
    :account_type_nvl,
    :administrations,
    :administration_group_nvl,
    :administration_info_list,
    :customer_info,
    :customer_info_list,
    :customer_invoice_info_list,
    :journal_info,
    :journal_info_list,
    :product,
    :product_info,
    :product_info_list,
    :product_nvl,
    :project_nvl,
    :project_info,
    :supplier_info,
    :supplier_info_list,
    :supplier_invoice_info_list

If you need to call a url that isn't covered by the gem's methods, make a custom request:

    client.custom_request(uri, opts = {})


    client.custom_request("/AdministrationNVL")

If you want to add params to your query, add them to the params hash in the method options (this works the same for all available methods):

    client.custom_request("/AdministrationNVL", { params: { fiscalYear: 'XXXX' } })




## Contributing

1. Fork it ( https://github.com/LaurensN/unit_4_multivers/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
