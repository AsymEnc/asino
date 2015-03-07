class AddTestUser < ActiveRecord::Migration
  def change
    User.create!(email:                 'testuser@example.com',
                 password:              ENV['ASINO_TEST_PASSWORD'],
                 password_confirmation: ENV['ASINO_TEST_PASSWORD'])
  end
end
