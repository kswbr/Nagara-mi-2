# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Site.create(id:1,name:"Cinra",url:"http://www.cinra.net/rss-music.xml",site_type_id:1);
Site.create(id:2,name:"KiwaKiwa",url:"http://www.kiwakiwa.jp/feed/",site_type_id:1);
Site.create(id:3,name:"ナタリー",url:"http://natalie.mu/music/feed/news/",site_type_id:1);
Site.create(id:4,name:"white-screen",url:"http://white-screen.jp/?feed=rss2",site_type_id:2);
Site.create(id:5,name:"AdGang",url:"http://adgang.jp/feed",site_type_id:3);
Site.create(id:6,name:"raw-fi",url:"http://raw-fi.com/feed.rss",site_type_id:4);
Site.create(id:7,name:"realsound",url:"http://realsound.jp/atom.xml",site_type_id:1);
# Site.create(id:8,name:"はてな - 音楽",url:"http://b.hatena.ne.jp/search/tag?safe=on&q=%E9%9F%B3%E6%A5%BD&mode=rss",site_type_id:1);

SiteType.create(id:1,name:"音楽");
SiteType.create(id:2,name:"映像");
SiteType.create(id:3,name:"企業広告");
SiteType.create(id:4,name:"メディア");

