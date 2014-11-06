require 'spec_helper'

describe Unit4Multivers do
  before do
    @client = Unit4Multivers::Client.new({
      :consumer_key => '12345',
      :consumer_secret => '67890'
    })
  end

  describe 'global settings' do
    it 'should expose the api_version' do
      expect(@client.api_version).to eq "v14"
    end

    it 'should all clients to set a new api version' do
      @client.api_version = "v15"
      expect(@client.api_version).to eq "v15"
    end
  end
end