require "test_helper"

describe AuthorsController do
  it "must get index" do
    get authors_index_url
    must_respond_with :success
  end

  it "must get show" do
    get authors_show_url
    must_respond_with :success
  end

end
