require 'open-uri'
require 'uri'
require 'hpricot'

class Googleit < TikTok::Cog
  on_listen /^googleit (.+)?/i, :google

  def google(message)
    doc = open("http://www.google.com.br/search?q=" + URI.escape(/^googleit (.+)?/i.match(message.body)[1])) {|f| Hpricot(f) }
    doc.search("//div[@id='ires']/ol/li").each do |first|
      remote_url = first.search("//a").first['href'].force_encoding("UTF-8").encode("UTF-8", "Windows-1252")
      title = first.search("//a").first.inner_html.force_encoding("UTF-8").encode("UTF-8", "Windows-1252").gsub(/<.*?>/, '')
      description = first.search("//div[@class='s']").first.inner_html.force_encoding("UTF-8").encode("UTF-8", "Windows-1252").scan(/\<.*\/>/)[0].gsub(/<.*?>/, '')
      
      message.room.speak "#{title} (#{remote_url}) => '#{description}'"
      break
    end    
  end
end


