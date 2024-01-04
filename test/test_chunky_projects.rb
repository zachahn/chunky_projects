# frozen_string_literal: true

require_relative "test_helper"

class TestChunkyProjects < Minitest::Test
  def test_basic_transformation
    assert_equal(
      "<h1>Chunky Projects</h1>",
      ChunkyProjects.to_html("h1. Chunky Projects")
    )
  end

  def test_blob
    input = SecureRandom.random_bytes(10)
    assert_raises(ChunkyProjects::EncodingError) do
      ChunkyProjects.to_html(input)
    end
  end
end
