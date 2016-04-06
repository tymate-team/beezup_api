require 'helper'

describe BeezupApi::OrderList do
  # before do
  # end

  let(:client){BeezupApi::Client.new('user_id','primary_token')}
  let(:orders){client.orders}

  it "should be able to get orders list" do
    expect(orders).to be_instance_of(BeezupApi::OrderList)
  end

  it "should be able to iterate on pages" do
    expect(orders.all).to be_instance_of(Enumerator)
  end

  it "expect that totalNumberOfEntries is equal to iterate count" do
    orders_count = 0
    orders.all.each do |order|
      orders_count += 1
    end

    expect(orders_count).to eq(orders.pagination_result.totalNumberOfEntries)
  end

end
