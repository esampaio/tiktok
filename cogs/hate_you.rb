# encoding: UTF-8
class HateYou < TikTok::Cog
  on_listen /tik-tok/i, :hate
  
  def hate(message)
    msgs = ["O que foi agora?",
              "Me aguarde...",
              "BLAH! Num enche cara!",
              "Ainda nao fui com a sua cara!",
              "You SUCKER!",
              "Quando você souber o que é um Value Object a gente conversa, ok? ;]",
              "Aham, senta lá, Claudia!",
              "Puxa, muito inteligente da sua parte!",
              "Caaaaaalado!",
              "Shhhhhh...",
              "I'm a WINNER; You're a LOOSER!",
              "Ui! Fiquei com medinha...",
              "Isso é uma puta falta de sacanagem!",
              "Eu sou jornalista, porra, caralho!",
              "Cai fora seu cabeca de bigorna!",
              "Que bichino legal! Sabe falar!",
              "Cara, você programa em Windows, então, shiu!",
              "Vou colocar sua frase no final de minha queue!",
              "Bastard!",
              "Tudo o que você faz, eu faço melhor :]",
              "not my problem",
              "CÁRCERE PRIVADO, CÁRCERE PRIVADO!",
              "uhum, uhum!"
            ]
            
    message.room.speak msgs.sample
  end
end
