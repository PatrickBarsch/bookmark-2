require 'pg'

feature 'Add a bookmark' do
  scenario 'a bookmark can be added and is shown afterwards in the list' do 
    visit('/add')
    fill_in('bookmark_title', with: 'Ford')
    fill_in('bookmark_url', with: 'http://www.ford.com/')
    click_button('Add Bookmark')
    expect(page).to have_content('Ford - http://www.ford.com/')
  end
end