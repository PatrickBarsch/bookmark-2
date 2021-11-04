require 'bookmark'

describe Bookmark do
  describe '.all' do
    it 'returns all bookmarks' do
      con = PG.connect(dbname: 'bookmark_manager_test')
      con.exec "INSERT INTO bookmarks VALUES(1, 'http://www.makersacademy.com/')"
      con.exec "INSERT INTO bookmarks VALUES(2, 'http://www.twitter.com/')"
      con.exec "INSERT INTO bookmarks VALUES(3, 'http://www.google.com/')"
      
      bookmarks = Bookmark.all
      expect(bookmarks).to include('http://www.makersacademy.com/')
      expect(bookmarks).to include('http://www.twitter.com/')
      expect(bookmarks).to include('http://www.google.com/')
    end
  end
end
