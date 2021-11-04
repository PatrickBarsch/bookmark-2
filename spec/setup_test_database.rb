
def setup_test_database 
  p "Setting up test database..."

  con = PG.connect(dbname: 'bookmark_manager_test')

  # Clear the bookmarks table
  con.exec("TRUNCATE bookmarks;")
end