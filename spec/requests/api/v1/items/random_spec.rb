require "rails_helper"

context "GET /items/random" do
  it "finds a random item record" do
    item1 = create(:item)
    item2 = create(:item)

    item_ids = Items.all.pluck(:id)

    get 'api/v1/items/random'

    item = JSON.parse(response.body)

    expect(response).to be_success
    item_ids.should include(item["id"])
  end
end


# invoice_item_ids = InvoiceItem.all.pluck(:id)
#
# get '/api/v1/invoice_items/random'
#
# invoice_item = JSON.parse(response.body)
#
