require 'rails_helper'

feature 'User page' do

  let(:user) { create(:user) }
  let!(:upload) { create(:upload, user: user) }

  before do
    login_as(user, scope: :user)
    visit user_path(user)
  end

  scenario 'User have email' do
    expect(page).to have_content(user.email)
  end

  scenario 'User have Upload' do
    expect(page).to have_content(user.uploads.first.title)
  end

  scenario 'User can edit Upload' do
    click_link('Edit')
    fill_in 'upload[title]', with: 'TestTitle'
    attach_file('upload[file]', File.join(Rails.root, '/spec/support/test_2.txt'))
    click_button('Save')

    expect(page).to have_content('TestTitle')
    expect(page).to have_content('test_2.txt')
    expect(page).to_not have_content(upload.file)
  end

  scenario 'User can delete Upload' do
    click_link('Destroy')
    expect(page).to_not have_content(upload.title)
    expect(page).to_not have_content(upload.file)
  end

  scenario 'User can add Upload' do
    fill_in 'upload[title]', with: 'TestTitle'
    attach_file('upload[file]', File.join(Rails.root, '/spec/support/test_2.txt'))
    click_button('Save')

    expect(page).to have_content(upload.title)
    expect(page).to have_content(upload.file)
    expect(page).to have_content('TestTitle')
    expect(page).to have_content('test_2.txt')
  end

  scenario 'User can not add Upload without title' do
    attach_file('upload[file]', File.join(Rails.root, '/spec/support/test_2.txt'))
    click_button('Save')
    expect(page).to have_css('.alert.alert-danger')
    expect(page).to have_content('Please review the problems below:')
  end

  scenario 'User can not add Upload without file' do
    fill_in 'upload[title]', with: 'TestTitle'
    click_button('Save')
    expect(page).to have_css('.alert.alert-danger')
    expect(page).to have_content('Please review the problems below:')
  end
end
