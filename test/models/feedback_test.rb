require 'test_helper'

class FeedbackTest < ActiveSupport::TestCase
  def setup
    @feedback = Feedback.new(name: 'Foo Bar', email: 'foo@bar.com', body: 'Some feedback text here')
  end

  test 'should be valid' do
    assert @feedback.valid?
  end

  test 'name should be present' do
    @feedback.name = '   '
    assert_not @feedback.valid?
  end

  test 'name should not be too long' do
    @feedback.name = 'a' * 31
    assert_not @feedback.valid?
  end

  test 'email should be present' do
    @feedback.email = '    '
    assert_not @feedback.valid?
  end

  test 'email should not be too long' do
    @feedback.email = "#{'a' * 250}@example.com"
    assert_not @feedback.valid?
  end

  test 'email should be valid' do
    valid_emails = %w(FOO@bar.com user@example.com B_a-r@foo.org.ua foo.bar@foobar.org mr+mrs@married.org)
    valid_emails.each do |valid_email|
      @feedback.email = valid_email
      assert @feedback.valid?
    end
  end

  test 'invalid emails' do
    invalid_emails = %w(foo@bar user@example,com hello_at_new.world.org foo.bar@foobar. foobar@_example.com)
    invalid_emails.each do |invalid_email|
      @feedback.email = invalid_email
      assert_not @feedback.valid?
    end
  end

  test 'body should not be too short' do
    @feedback.body = 'a'
    assert_not @feedback.valid?
  end

  test 'body should not be too long' do
    @feedback.body = 'a' * 769
    assert_not @feedback.valid?
  end
end
