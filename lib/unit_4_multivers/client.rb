require "unit_4_multivers/account"
require "unit_4_multivers/administration"
require "unit_4_multivers/customer"
require "unit_4_multivers/journal"
require "unit_4_multivers/product"
require "unit_4_multivers/project"
require "unit_4_multivers/openingbalance"
require "unit_4_multivers/supplier"
require "unit_4_multivers/version"

module Unit4Multivers
  class Client
    API_VERSION = 'v14'
    # Sets or gets the api_version to be used in API calls
    #"
    # @return [String]
    attr_accessor :api_version

    # Sets or gets the division id to be used in API calls
    #
    # @return [String]
    #attr_accessor :division_id, :database_name

    def initialize(opts)
      required = [:consumer_key, :consumer_secret]
      check_required_parameters(required, opts)

      @consumer_key = opts[:consumer_key]
      @consumer_secret = opts[:consumer_secret]

      @token = opts[:token]
      @secret = opts[:secret]

      @proxy = opts[:proxy] if opts[:proxy]
      @database_name = opts[:database_name]

      @api_version = API_VERSION
    end


    def authorize(token, secret, opts={})
      request_token = OAuth2::RequestToken.new(client, token, secret)
      @access_token = request_token.get_access_token(opts)
      @token = @access_token.token
      @secret = @access_token.secret
      @access_token
    end


    def reconnect(token, secret)
      @token = token
      @secret = secret
      access_token
    end

    def connected?
      !@access_token.nil?
    end

    def request_token_url(opts={})
      required = [:redirect_uri]
      check_required_parameters(required, opts)

      oauth_client.auth_code.authorize_url(:redirect_uri => opts[:redirect_uri], scope: "http://UNIT4.Multivers.API/Web/WebApi/*")
    end

    def request_access_token(code, opts={})
      required = [:redirect_uri]
      check_required_parameters(required, opts)

      @access_token = oauth_client.auth_code.get_token(code, :redirect_uri => opts[:redirect_uri])
    end

    # Make a custom request
    def custom_request(uri, opts = {})
      get uri, opts
    end

    def refresh_token!
      @access_token = access_token.refresh!
    end

    def token_expired?
      access_token.expired?
    end

    def check_required_parameters(required, params)
      params.fetch(required) { raise ArgumentError, "Missing required parameters: #{required - params.keys}" if (required-params.keys).size > 0 }
    end


    private
      def oauth_client
        @oauth_client ||= OAuth2::Client.new(@consumer_key, @consumer_secret,
            :site => { :url => "https://sandbox.api.online.unit4.nl/#{@api_version}/" },
            :token_url => 'OAuth/Token/',
            :authorize_url => 'OAuth/Authorize/')
      end

      def access_token
        @access_token #||= OAuth2::AccessToken.new(oauth_client, @token, @secret)
      end

      def get(path, headers={})
        @access_token.refresh_token! if access_token.expired?
        extract_response_body raw_get(path, headers)
      end

      def raw_get(path, headers={})
        headers.merge!(:headers => { 'User-Agent' => "Unit4Multivers gem",
               'Accept' => 'application/json' })

        uri = "api#{path}"
        p "Getting #{uri}"
        access_token.get(uri, headers)
      end

      def post(path, body='', headers={})
        extract_response_body raw_post(path, body, headers)
      end

      def raw_post(path, body='', headers={})
        headers.merge!(:headers => { 'User-Agent' => "Unit4Multivers gem" })
        uri = "api#{path}"
        access_token.post(uri, body, headers)
      end

      def delete(path, headers={})
        extract_response_body raw_delete(path, headers)
      end

      def raw_delete(path, headers={})
        headers.merge!(:headers => { 'User-Agent' => "Unit4Multivers gem" })
        uri = "api#{path}"
        access_token.delete(uri, headers)
      end

      def extract_response_body(resp)
        resp.nil? || resp.body.nil? ? {} : JSON.parse(resp.body)
      end
  end
end


