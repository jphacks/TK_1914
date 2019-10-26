
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
    User.create(
      name: "川谷英斗",
      nick_name: "ニーザ",
      img: "https://res.cloudinary.com/dlmbukavs/image/upload/v1569656426/aox4qy3ofbnjbxcitwo6.jpg"
    )
  end

  task :link do
    Link.create(
      user_id: 1,
      media_id: 1,
      url: "https://twitter.com/niza_lit"
    )
  end
end
