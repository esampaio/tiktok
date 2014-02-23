class Digdin < TikTok::Cog
  on_listen /dig(\s+)?din/i, :digdin
  on_listen /sou foda/i, :digdin

  def digdin(message)
    images = [
      "http://www.oesquema.com.br/trabalhosujo/wp-content/uploads/2011/03/digdin.jpg",
      "http://25.media.tumblr.com/tumblr_lgo52m2Pgn1qh99vdo1_500.jpg",
      ]
    message.room.speak images.sample
  end
end
