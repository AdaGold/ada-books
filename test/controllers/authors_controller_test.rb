require "test_helper"

describe AuthorsController do
  before do
    @author = Author.create(name: "R.J. Palacio")
  end

  it "must get index" do
    get authors_path
    must_respond_with :success
  end

  it "must get show" do
    
    get author_path(@author.id)
    must_respond_with :success
  end

  it "will give a 404 error for a nonexistant author" do
    get author_path(-1)
    
    must_respond_with :not_found
  end

end
