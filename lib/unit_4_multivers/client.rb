require "unit_4_multivers/account"
require "unit_4_multivers/administration"
require "unit_4_multivers/customer"
require "unit_4_multivers/customer_invoice"
require "unit_4_multivers/journal"
require "unit_4_multivers/order"
require "unit_4_multivers/product"
require "unit_4_multivers/project"
require "unit_4_multivers/openingbalance"
require "unit_4_multivers/supplier"
require "unit_4_multivers/bank_account"
require "unit_4_multivers/version"

module Unit4Multivers
  class Client
    API_VERSION = 'v182'
    # Sets or gets the api_version to be used in API calls
    #"
    # @return [String]
    attr_accessor :api_version

    # Sets or gets the database to be used in API calls
    #
    # @return [String]
    attr_accessor :database

    # Sets or gets the data format to be used in API calls (json or xml)
    #
    # @return [String]
    attr_accessor :format

    # Sets or gets the api root path
    #
    # @return [String]
    attr_accessor :api_root


    def initialize(opts)
      required = [:consumer_key, :consumer_secret]
      check_required_parameters(required, opts)

      @consumer_key = opts[:consumer_key]
      @consumer_secret = opts[:consumer_secret]

      @token = opts[:token]
      @secret = opts[:secret]

      @proxy = opts[:proxy] if opts[:proxy]
      @database = opts[:database]

      @api_version = API_VERSION
      @api_root = 'api'

      @token_file_path = opts[:token_file_path]
    end

    def authorize(token, secret, opts={})
      request_token = OAuth2::RequestToken.new(client, token, secret)
      @access_token = request_token.get_access_token(opts)
      @token = @access_token.token
      @secret = @access_token.secret
      @access_token
    end

    def logoff
      @access_token = nil
      File.open(@token_file_path, 'w') { |file| file.write {}.to_yaml } if @token_file_path.present?
    end

    def load_token_from_file
      return unless @token_file_path.present?
      @access_token = OAuth2::AccessToken.from_hash(oauth_client, YAML::load_file(@token_file_path))
    end

    def save_token_to_file
      return unless @token_file_path.present? && access_token.present?
      File.open(@token_file_path, 'w') { |file| file.write access_token.to_hash.to_yaml }
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
      save_token_to_file
    end

    def token_expired?
      access_token.expired?
    end

    def check_required_parameters(required, params)
      params.fetch(required) { raise ArgumentError, "Missing required parameters: #{required - params.keys}" if (required-params.keys).size > 0 }
    end

    def access_token
      @access_token
    end

    private

      def oauth_client
        @oauth_client ||= OAuth2::Client.new(@consumer_key, @consumer_secret,
            :site => { :url => "https://sandbox.api.online.unit4.nl/#{@api_version}/" },
            :token_url => 'OAuth/Token/',
            :authorize_url => 'OAuth/Authorize/')
      end

      def content_type
        "application/#{format.downcase}" if format.present?
      end

      def base_headers
        {
          'User-Agent' => "Unit4Multivers gem",
          'Accept' => 'application/json'
        }.merge(content_type.present? ? { 'Content-Type' => content_type } : {})
      end

      def get path, options={}
        self.refresh_token! if access_token.expired?
        extract_response_body raw_get(path, base_headers)
      end

      def raw_get path, headers={}
        access_token.get("#{api_root}#{path}", headers: headers)
      end

      def post path, data, options={}
        self.refresh_token! if access_token.expired?
        extract_response_body raw_post(path, data, base_headers)
      end

      def raw_post path, data, headers={}
        access_token.post("#{api_root}#{path}", body: data, headers: headers)
      end

      def put path, data, options={}
        self.refresh_token! if access_token.expired?
        extract_response_body raw_put(path, data, base_headers)
      end

      def raw_put path, data, headers={}
        access_token.put("#{api_root}#{path}", body: data, headers: headers)
      end

      def delete path, options={}
        self.refresh_token! if access_token.expired?
        extract_response_body raw_delete(path, base_headers)
      end

      def raw_delete path, headers={}
        access_token.delete("#{api_root}#{path}", headers: headers)
      end

      def extract_response_body(resp)
        resp.nil? || resp.body.nil? ? {} : JSON.parse(resp.body)
      end
  end
end
