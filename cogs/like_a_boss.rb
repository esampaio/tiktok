class LikeABoss < TikTok::Cog
  on_listen /like a boss/i, :like_a_boss

  def like_a_boss(message)
    images = [
      "http://s3.amazonaws.com/kym-assets/photos/images/original/000/114/151/14185212UtNF3Va6.gif?1302832919",
      "http://s3.amazonaws.com/kym-assets/photos/images/newsfeed/000/110/885/boss.jpg",
      "http://verydemotivational.files.wordpress.com/2011/06/demotivational-posters-like-a-boss.jpg",
      "http://assets.head-fi.org/b/b3/b3ba6b88_funny-facebook-fails-like-a-boss3.jpg",
      "http://img.anongallery.org/img/6/0/like-a-boss.jpg",
      ]
    message.room.speak images.sample
  end
end
