require 'test_helper'

class FilesControllerTest < ActionController::TestCase
  test "new" do
    get :new
    assert_equal response.status, 200
  end

  test "create" do

  end
end
