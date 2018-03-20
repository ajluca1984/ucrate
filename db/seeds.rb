# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
require 'seed_methods'

class AddInitialObjects < ActiveRecord::Migration[5.1]

  rando_pass = Devise.friendly_token.first(8)
  accounts = {'manydeposits@example.com' => 'Many Deposits', 'nodeposits@example.com' => 'No Deposits', 'delegate@example.com' => 'Student Delegate'}

  accounts.each do | email, name |
    unless User.where(email: email).exists?
      SeedMethods.new_account(email, name, rando_pass)
      puts "-- Test account created: #{email}, #{rando_pass}"
    end
  end

  accounts.reject{ | email, name | email == 'nodeposits@example.com' }.each do | email, name |
    10.times { |i| SeedMethods.new_genericwork(email, name) }
  end

  def self.create_admin_role(id)
    admin = Role.create(name: 'admin')
    admin.users << User.find(id)
    admin.save
  end

  def self.create_admin_account
    rando_pass = Devise.friendly_token.first(8)
    user = User.create email: 'admin@example.com', password: rando_pass
    puts "\n\n\t\t*** ADMIN USER (admin@example.com) PASS: #{rando_pass} ***\n\n"
    user.save
    user.id
  end

  create_admin_role(create_admin_account)
  ActiveFedora::Base.reindex_everything
end
