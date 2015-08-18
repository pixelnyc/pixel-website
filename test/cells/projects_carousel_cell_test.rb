require 'test_helper'

class ProjectsCarouselCellTest < Cell::TestCase
  test "show" do
    invoke :show
    assert_select "p"
  end
  

end
