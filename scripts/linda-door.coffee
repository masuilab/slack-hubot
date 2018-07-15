# Description:
#   lindaでドアを開ける
#
# Commands:
#   hubot 開けて
#
# Author:
#   @shokai

module.exports = (robot) ->

  robot.on 'linda:ready', (linda) ->

    robot.respond /開けて/i, (msg) ->
      who = msg.message.user.name
      where = "delta"
      cmd = "open"

      linda.read_with_timeout linda.config.space,
        type: "door"
        cmd: cmd
        who: who
        response: "success"
      , 5000, (err, tuple) ->
        if err
          msg.send "@#{who} ドアには・・勝てなかったよ（失敗）"
          return
        msg.send "@#{who} 開けたと思う"

      linda.tuplespace(linda.config.space).write
        type: "door"
        cmd: cmd
        who: who
        where: where
      return

    robot.respond /(ドア|door)/i, (msg) ->
      msg.send """
      hubotでドアを開ける・閉める
      (例)
      hubot 開けて
      """
      return
