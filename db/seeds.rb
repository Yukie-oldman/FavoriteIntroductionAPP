# coding: utf-8

User.create!( name: "サンプルくん",
              email: "a@email.com",
              password: "password",
              password_confirmation: "password",
              admin: true)
              
User.create!( name: "二人目さん",
              email: "b@email.com",
              password: "password",
              password_confirmation: "password")

puts ('created users')

target = User.first

target.introductions.create!( caption: "頭文字Dファンならイチオシのアイテム",
name: '頭文字D Special Stage',
contents: '原作を再現したストーリーモードが熱い！「セカンダリタービンが止まってんじゃねーのか」「板金７万コースか」「一万一千まできっちり回せ」などの名台詞がたくさん！')