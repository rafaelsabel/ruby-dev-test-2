require 'test_helper'

class AlbumTest < ActiveSupport::TestCase
  test "valid album" do
    album = Album.new(name: 'Madonna X Shakira', contributors_attributes: [{ player_id: players(:madonna).id }, { player_id: players(:shakira).id }])
    assert album.valid?
  end

  test "presence of name" do
    album = Album.new
    assert_not album.valid?
    assert_not_empty album.errors[:name]
  end

  test "presence of contributors" do
    album = Album.new
    assert_not album.valid?
    assert_not_empty album.errors[:contributors]
  end

  test "unique players" do
    album = Album.new(name: 'Peligro', contributors_attributes: [{ player_id: players(:shakira).id }, { player_id: players(:shakira).id }])
    assert_not album.valid?
    assert_not_empty album.errors[:contributors]
  end
end
