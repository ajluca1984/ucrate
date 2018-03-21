# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
class AddSeedObjects < ActiveRecord::Migration[5.1]

  password = Devise.friendly_token.first(8)

  many_deposits = User.create(
    email: 'manydeposits93@example.com',
    first_name: 'Many',
    last_name: 'Deposits',
    password: password,
    password_confirmation: password)
  puts "Seed account created: #{many_deposits.email}, #{password}"

  student_delegate = User.create(
    email: 'delegate63@example.com',
    first_name: 'Student',
    last_name: 'Delegate',
    password: password,
    password_confirmation: password)
  puts "Seed account created: #{student_delegate.email}, #{password}"

  admin_user = User.create(
    email: 'admin53@example.com',
    first_name: 'Admin',
    last_name: 'User',
    password: password,
    password_confirmation: password)
  admin = Role.create(name: 'admin')
  admin.users << admin_user
  admin.save
  puts "Seed account created: #{admin_user.email}, #{password} (admin)"

  10.times do
    work = GenericWork.create(
      title: ['This is the title NEW'],
      description: ['This is the description'],
      depositor: many_deposits.email,
      owner: many_deposits.email,
      creator: ["#{many_deposits.last_name}, #{many_deposits.first_name}"],
      subject: ['geography', 'history', 'chemistry'],
      rights_statement: ["http://rightsstatements.org/vocab/InC/1.0/"],
      publisher: ['Penguin Publishing'],
      language: ['English'],
      based_near: ['The world'],
      date_created: [Time.zone.at(rand * Time.now.to_i).to_s.sub(/\s(.*)/, '')]
    )
    work.read_groups = [Hydra::AccessControls::AccessRight::PERMISSION_TEXT_VALUE_PUBLIC]
    work.edit_users = [many_deposits.email]
    work.save
    work.to_solr
  end
end
