require '../models/users.rb'

if User.count == 0
  User.create(
    name: "川谷英斗",
    nick_name: "ニーザ",
    img: "https://res.cloudinary.com/dlmbukavs/image/upload/v1569656426/aox4qy3ofbnjbxcitwo6.jpg",
    qr: make_qr()
  )
end