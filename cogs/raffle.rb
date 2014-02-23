# encoding: utf-8
class Raffle < TikTok::Cog
  on_listen /^raffle (.+)?/i, :winner

  def winner(message)
    entrants = /^raffle (.+)?/i.match(message.body)[1]
    winner = entrants.split(',').sample
    message.room.play "rimshot"
    message.room.speak "AND THE WINNER IS ===> #{winner.strip.capitalize}"
  end
end
