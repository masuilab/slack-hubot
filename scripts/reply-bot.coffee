# Description:
#   腹が減ったらカレーメシ、のようなリプライをする
#
# Author:
#   @shokai

_ = require 'lodash'

config =
  gyazz:
    hear: [ /\[([^\[\]]+)\]/ ]
    reply: (msg) ->
      name = msg.match[1].replace(" ", "%20")
      [title, wiki] = name.split('/').reverse()
      title = title.replace(/ /g, '%20')
      "https://scrapbox.io/#{wiki||'masuilab'}/#{title}"
  カレーメシ:
    hear: [
      /カレー/i
      /curry/i
      /(おなか|ハラ|はら|腹)/i
    ]
    reply: [
      'カレーメシ！！'
      'ボーキメシ！！'
      'ジャッスティス！！！'
      'http://www.currymeshi.com'
      'https://gyazo.com/fc6c4a6f74d41ee472948c35d7ab1d45/raw'
      'https://www.youtube.com/watch?v=vhSBtoviSKw'
    ]
    ratio: 0.3
  かず:
    hear: [
      /^かず$/i
    ]
    reply: [
      'かずすけ'
      'かずどん'
      'カーズ様'
      'キングカズ'
      'かずお'
      ':kazudon:'
      ':kazusuke:'
      'ガズ皇帝'
      '何度言わせるのよ、このクズ！！'
      '\n:kazudon1-1::kazudon1-2::kazudon1-3::kazudon1-4::kazudon1-5::kazudon1-6::kazudon1-7::kazudon1-8:\n:kazudon2-1::kazudon2-2::kazudon2-3::kazudon2-4::kazudon2-5::kazudon2-6::kazudon2-7::kazudon2-8:\n:kazudon3-1::kazudon3-2::kazudon3-3::kazudon3-4::kazudon3-5::kazudon3-6::kazudon3-7::kazudon3-8:'
    ]
  ちくわ:
    hear: [
      /ちくわ/i
      /竹輪/i
      /筑摩/i
    ]
    reply: [
      'http://tiqav.com/1aM.jpg'
      'http://tiqav.com/1de.jpg'
    ]
  進捗:
    hear: [
      /進捗/i
    ]
    reply: [
      'https://gyazo.com/9376e42235fbd2ae1c87f1eab10802c9/raw'
      'https://gyazo.com/2443a25d349ea480c5d511cfbf39292a/raw'
      'https://gyazo.com/c46ec4e2740bb0c86aa58fae38b18864/raw'
    ]
  PHP:
    hear: [
      /PHP/i
    ]
    reply: [
      'php..ﾏｽﾄﾀﾞｰｲ..'
      '殺せ、PHPだ'
      'PHPを使うものは腹を切って死ぬべきである。詳しくは https://scrapbox.io/masuilab/PHP を読んで熟知すべし'
      'PHPもいいところあるんですよぉ'
      'sudo rm /usr/bin/php'
      'その、拡張子でPHP使ってる事アピールするの何か意味あるんですか？'
      'PHP is evil'
      'https://gyazo.com/c0e830968217f4c41ab6e0c7ded1a62c/raw'
      'https://gyazo.com/358c5cdb80388d51c0c8fac9a3fc08fe/raw'
      'https://gyazo.com/48a249354b0aef2ff76dc937d4305444/raw'
    ]
  わかる:
    hear: [
      /^わかる$/i
      /^納得$/i
      /^わかった$/i
      /^わかりました$/i
      /^合点$/i
    ]
    reply: [
      "https://gyazo.com/cf539d217b04a907c0a2ebe700479f2a/raw"
      "https://gyazo.com/4782005540d5f7f1f08d7b5a2650d0a7/raw"
      "https://gyazo.com/d199cacc0fb79909087cd2224957bbde/raw"
      "https://gyazo.com/e3b8c028df43cfaf5c8bff15f2c2bec0/raw"
      "https://gyazo.com/46ad24d46904a21cda6e644d23300ec2/raw"
      "https://gyazo.com/190fe0af852442ae98fd4f1de4d63987/raw"
      "https://gyazo.com/f0a2bec554a7d491e3ed56b61d718367/raw"
      "https://gyazo.com/c22f8e1a3860de61e209c4e54e5e766f/raw"
    ]
    ratio: 0.4
  質問:
    hear: [
      /わからない$/i
      /わからん/
      /(教|おし)えて/
    ]
    reply: [
      'ぐぐれカス〜'
      'https://gyazo.com/205adeb36e6542c6db29f571452166fa/raw'
      'まあ落ち着け http://games.kids.yahoo.co.jp/sports/013.html'
      'コード書けばいいじゃん'
      "https://gyazo.com/cf539d217b04a907c0a2ebe700479f2a/raw"
      "https://gyazo.com/4782005540d5f7f1f08d7b5a2650d0a7/raw"
      "https://gyazo.com/d199cacc0fb79909087cd2224957bbde/raw"
      "https://gyazo.com/e3b8c028df43cfaf5c8bff15f2c2bec0/raw"
      "https://gyazo.com/0df07d38f8aba8af7371a8d99fbf5215/raw"
      "ここは、心のリアクションがわかる世界\nhttp://wakaru.3memo.com/masuilab"
    ]
    ratio: 0.1
  いくつ:
    hear: [
      /いくつ/
      /何個/
    ]
    reply: (msg) -> "#{Math.floor(Math.random()*10)+1}個でじゅうぶんですよ"
    ratio: 1
  shuffle:
    hear: [
      /(.+)$/i
    ]
    reply: (msg) ->
      text = msg.match[0]
      if text.length > 3 and text.length < 10
        _.shuffle(text.split('')).join('')
    ratio: 0.005
  gist:
    hear: [
      /gist.github/
    ]
    reply: [
      'ずいぶんとダサいコードを書いているのね'
    ]
    ratio: 0.2
  かずすけ:
    hear: [
      /(.*忘年会.*)$/
      /(.*新年会.*)$/
      /(.*飲み会.*)$/
      /(.*呑み会.*)$/
      /(.*肉.*)$/
    ]
    reply: [
      'かず'
      'かずすけ？'
      'すけかず'
      'かずのすけ'
      '金のホルモン'
      'マルチョウ'
      (msg) -> "かずすけ「#{msg.match[0]}」"
      'はい、湘南台かずすけです'
      'http://blog.naotaco.com/archives/197'
      'http://tabelog.com/kanagawa/A1404/A140405/14018634/'
      'https://www.flickr.com/photos/shokai/8178681503/'
      'https://www.flickr.com/photos/shokai/7575397070/'
      'https://www.flickr.com/photos/shokai/5148760554/'
    ]
    ratio: 0.6
  小竹向原:
    hear: [
      /小竹向原/
      /kotakemukaihara/
      /佐竹/
    ]
    reply: [
      'https://gyazo.com/575ea914c736ee510b90f831775d131d/raw'
      'https://gyazo.com/ec5a00201b3ee41de58bb0fe8f827090/raw'
      ':kotakemukaihara:'
      '🈂 :take: :mukai: :hara:'
      (msg) ->
        [0..Math.random()*5]
          .map ->
            _.sample [":ko:", ":take:", ":mukai:", ":hara:"]
          .join ' '
    ]
    ratio: 0.8
  見える化:
    hear: [
      /見える化/
    ]
    reply: [
      "可視化"
    ]

module.exports = (robot) ->

  for name, data of config
    robot.logger.info "configure reply bot: #{name}"
    do (data) ->
      for regex in data.hear
        robot.hear regex, (msg) ->
          return if (data.ratio or 1) < Math.random()
          who = msg.message.user.name
          text = null
          if typeof data.reply is 'function'
            text = data.reply msg
          if data.reply instanceof Array
            text = _.sample data.reply
            if typeof text is 'function'
              text = text msg

          return unless text
          msg.send "@#{who} #{text}"
