require 'minitest_helper'

class SectionMethodTest < UnitTest
  # to_params
  test "returns a pretty to_params" do
    section = FactoryGirl.build(:section, :section_order => 2, :title => 'Elementary')
    assert_equal '2-elementary', section.to_params
  end

  test "returns a pretty to_params with a space in the title" do
    section = FactoryGirl.build(:section, :section_order => 2, :title => 'Staff Photos')
    assert_equal '2-staff-photos', section.to_params
  end
end
