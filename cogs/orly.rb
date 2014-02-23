class Orly < TikTok::Cog
  on_listen /orly/, :orly

  def orly(message)
    message.room.speak 'http://s3.amazonaws.com/kym-assets/entries/icons/original/000/000/015/orly.jpg?1229112642'
  end
end
