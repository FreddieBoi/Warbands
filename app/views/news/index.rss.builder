xml.instruct! :xml, :version => "1.0" 
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "Warbands Online Developer News"
    xml.description "News from the developers of Warbands Online"
    xml.link news_index_url

    for post in @news
      xml.item do
        xml.title post.title
        xml.description post.content
        xml.pubDate post.created_at.to_s(:rfc822)
        xml.author post.user.name
        xml.link news_url(post)
        xml.guid news_url(post)
      end
    end
  end
end
