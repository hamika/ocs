require 'rails_helper'
require 'capybara/rspec'

feature 'customer_new' do
  # before do
  #   user = FactoryGirl.create(:user)
  #   login_as(user, scope: :user)
  # end
  let(:user) { create(:user) }
  before do
    login_as(user, scope: :user)
  end


  scenario "新規customer作成" do # js: true
    visit root_path
    expect{
      click_link 'Customers'
      click_link 'New Customer'
      fill_in 'First name', with: 'でき太郎'
      fill_in 'Last name', with: '満天'
      fill_in 'Address', with: '千葉'
      fill_in 'Phone', with: '09012343210'
      fill_in 'Email', with: 'mantenmanten@example.com'
      # fill_in 'Birthday', with: 19700101
      select '1970', from: 'customer_birthday_1i'
      select '12', from: 'customer_birthday_2i'
      select '24', from: 'customer_birthday_3i'
      # find('#gender').fill_in 'Gender', with: ':female'
      select 'female', from: 'customer[gender]'
      click_on '#actions'
    }.to change(Customer, :count).by(1)
    expect(current_path).to eq customers_path
    expect(page).to have_content 'Customer was successfully created.'
  end
end
