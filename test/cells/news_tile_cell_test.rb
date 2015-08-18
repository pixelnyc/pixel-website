require 'test_helper'

class NewsTileCellTest < Cell::TestCase
  test "show" do
    invoke :show
    assert_select "p"
  end
  

end
