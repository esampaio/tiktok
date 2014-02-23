require 'uri'

class Achievement < TikTok::Cog
  on_listen /achievement (get|unlock(ed)?) (.+?)$/i, :unlock

  def unlock(message)
    text = /achievement (get|unlock(ed)?) (.+?)$/i.match(message.body)
    message.room.speak "http://achievement-unlocked.heroku.com/xbox/#{URI.escape text[3]}.png"
  end
end
