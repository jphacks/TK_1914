
namespace :seed do
  task :media do
    MediaPlatform.create(name: 'twitter')
    MediaPlatform.create(name: 'instagram')
    MediaPlatform.create(name: 'facebook')
    MediaPlatform.create(name: 'youtube')
    MediaPlatform.create(name: 'spotify')
    MediaPlatform.create(name: 'tiktok')
    MediaPlatform.create(name: 'pinterest')
    MediaPlatform.create(name: 'note')
    MediaPlatform.create(name: 'portfolio')
    MediaPlatform.create(name: 'mail')
  end

  task :user do
    url = 'https://becky-484f7.firebaseapp.com/profile/1'
    user = User.create(
      name: "川谷英斗",
      nick_name: "ニーザ",
      img: "https://res.cloudinary.com/dlmbukavs/image/upload/v1569656426/aox4qy3ofbnjbxcitwo6.jpg",
      qr: 'http://res.cloudinary.com/dxladveje/image/upload/v1572146603/ijmfxzrxhjj3anwop99q.png',
      comment: '特技は舌が鼻につくことです'
    )
    Link.create(
      user_id: user.id,
      media_platform_id: 1,
      url: "https://twitter.com/niza_lit"
    )
    Link.create(
      user_id: user.id,
      media_platform_id: 2,
      url: "https://www.instagram.com/hidetoooooooo/"
    )
    Link.create(
      user_id: user.id,
      media_platform_id: 3,
      url: "https://www.facebook.com/kawatani.hideto"
    )
  end

  task :link do
    Link.create(
      user_id: 1,
      media_platform_id: 1,
      url: "https://twitter.com/niza_lit"
    )
    Link.create(
      user_id: 1,
      media_platform_id: 2,
      url: "https://www.instagram.com/hidetoooooooo/"
    )
    Link.create(
      user_id: 1,
      media_platform_id: 3,
      url: "https://www.facebook.com/kawatani.hideto"
    )
  end
end
