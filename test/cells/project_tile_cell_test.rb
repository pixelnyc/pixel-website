require 'test_helper'

class ProjectTileCellTest < Cell::TestCase
  test "show" do
    invoke :show
    assert_select "p"
  end
  

end
