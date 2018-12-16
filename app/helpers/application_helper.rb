module ApplicationHelper
  def search(word)
   # sql = "SELECT * FROM 'posts' WHERE MATCH ('title', 'body', 'tags') AGAINST '#{word}';"
    sql = "SELECT * FROM posts WHERE body MATCH '#{word}';"
    Post.find_by_sql(sql)
  end

  def reg_link
    source = ([*('A'..'Z'), *('a'..'z'), *('0'..'9')]-%w(0 1 I O)).sample(rand(8..16)).join
    Digest::SHA1.hexdigest source
  end
end
