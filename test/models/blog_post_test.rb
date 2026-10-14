require "test_helper"

class BlogPostTest < ActiveSupport::TestCase
  test "draft? return true for draft blog post" do
    assert BlogPost.new(published_at: nil).draft?
  end

  test "draft? return true for draft blog post" do
    assert blog_posts(:draft).draft? #matching with blog_posts.yml
  end

  test "draft? return false for draft blog post" do
    refute blog_posts(:published).draft?
  end

  test "draft? return false for draft blog post" do
    refute blog_posts(:scheduled).draft?
  end



  test "published? return true for draft blog post" do
    assert BlogPost.new(published_at: 1.year.ago).published?
  end

  test "published? return false for draft blog post" do
    refute BlogPost.new(published_at: nil).published?
  end

  test "published? return false for draft blog post" do
    refute BlogPost.new(published_at:1.year.from.now).published?
  end



  test "scheduled? return true for draft blog post" do
    assert BlogPost.new(published_at: 1.year.from.now).scheduled?
  end

  test "scheduled? return false for draft blog post" do
    refute draft_blog_post.scheduled? #Using helper method like this
  end

  test "scheduled? return false for draft blog post" do
    refute BlogPost.new(published_at:1.year.ago).scheduled?
  end


  #helper method
  def draft_blog_post
    BlogPost.new(published_at: nil)
  end
end
