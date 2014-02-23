class Echo < TikTok::Cog
  on_listen /.*/, :echo

  def echo(message)
    message.room.speak message.body
  end
end
