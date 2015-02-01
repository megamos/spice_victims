require 'test_helper'

class CreatingLinkTest < ActionDispatch::IntegrationTest
  test "adding a new link" do
    get new_link_path
    assert_template 'links/new'
    assert_difference 'Link.count', 1 do
      post links_path, link: {topic: "Test topic",
                              info: "Here goes the info",
                              url: "http://www.a-valid-url.com"}
    end
    assert_template 'victims/index'
  end
end
