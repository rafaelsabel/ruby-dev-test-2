require 'test_helper'

class ContributorTest < ActiveSupport::TestCase
  test "valid contributor" do
    contributor = Contributor.new(player_id: players(:madonna).id, album_id: albums(:madame_x).id)
    assert contributor.valid?
  end

  test "presence of associations" do
    contributor = Contributor.new
    assert_not contributor.valid?
    assert_not_empty contributor.errors[:player]
    assert_not_empty contributor.errors[:album]
  end

  test "unique associations" do
    Contributor.create!(player_id: players(:madonna).id, album_id: albums(:madame_x).id)
    contributor = Contributor.new(player_id: players(:madonna).id, album_id: albums(:madame_x).id)
    assert_not contributor.valid?
    assert_not_empty contributor.errors[:player]
    assert_not_empty contributor.errors[:album]
  end
end
