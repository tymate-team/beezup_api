require 'helper'

describe BeezupApi do

  before(:each) do
    BeezupApi.user_id = nil
    BeezupApi.primary_token = nil
  end

  it 'has a version number' do
    expect(BeezupApi::VERSION).not_to be nil
  end

  it "should be able to set the consumer user_id and consumer primary_token" do
    BeezupApi.user_id  = 'consumer_user_id'
    BeezupApi.primary_token = 'consumer_primary_token'

    expect(BeezupApi.user_id).to eq('consumer_user_id')
    expect(BeezupApi.primary_token).to eq('consumer_primary_token')
  end

  it "should be able to set the consumer user_id and consumer primary_token via a configure block" do
    BeezupApi.configure do |config|
      config.user_id  = 'consumer_user_id'
      config.primary_token = 'consumer_primary_token'
    end

    expect(BeezupApi.user_id).to eq('consumer_user_id')
    expect(BeezupApi.primary_token).to eq('consumer_primary_token')
  end

end
