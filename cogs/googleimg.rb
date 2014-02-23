require 'open-uri'
require 'uri'
require 'hpricot'

class Googleimg < TikTok::Cog
  on_listen /^googleimg (.+)?/i, :google

  def google(message)
    doc = open("http://www.google.com/search?hl=en&um=1&ie=UTF-8&tbm=isch&sa=N&biw=1920&bih=918&q=" + URI.escape(/^googleimg (.+)?/i.match(message.body)[1])) {|f| Hpricot(f) }
    anchor = doc.search("//tr/td/a").first
    if anchor.nil?
      message.room.play 'trombone'
      message.room.speak 'Try again moron'
    else
      image = anchor.get_attribute('href').match(/imgurl=(.*)&imgrefurl/)[1]
      message.room.speak image
    end
  end
end
