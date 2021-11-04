require 'pg'

feature 'Viewing bookmarks' do
  scenario 'visiting the index page' do
    visit('/')
    expect(page).to have_content 'Bookmark Manager'
  end

  scenario 'a user can see bookmarks' do
    con = PG.connect(dbname: 'bookmark_manager_test')
    con.exec "INSERT INTO bookmarks VALUES(1, 'http://www.makersacademy.com/')"
    con.exec "INSERT INTO bookmarks VALUES(2, 'http://www.twitter.com/')"
    con.exec "INSERT INTO bookmarks VALUES(3, 'http://www.google.com/')"

    visit('/bookmarks')    
    expect(page).to have_content('http://www.makersacademy.com/')
    expect(page).to have_content('http://www.twitter.com/')
    expect(page).to have_content('http://www.google.com/')
  end
end
