require "test_helper"

describe BooksController do
  it "should get index" do
    get "/books"
    must_respond_with :success
  end
end
