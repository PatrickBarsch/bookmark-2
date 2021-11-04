require 'pg'

class Bookmark
  def self.all
    if ENV['RACK_ENV'] == 'test'
      con = PG.connect(dbname: 'bookmark_manager_test')
    else
      con = PG.connect(dbname: 'bookmark_manager')
    end

    rs = con.exec 'SELECT * FROM bookmarks'
    rs.map { |bookmark| { title: bookmark['title'], url: bookmark['url'] } }
  end
  def self.create(title, url)
    if ENV['RACK_ENV'] == 'test'
      con = PG.connect(dbname: 'bookmark_manager_test')
    else
      con = PG.connect(dbname: 'bookmark_manager')
    end
    con.exec("INSERT INTO bookmarks(title, url) VALUES('#{ title }', '#{ url }');")
  end
end
