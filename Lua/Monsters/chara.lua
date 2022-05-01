require "Animations.chara"

messages = {}

function SetLang()
  if Encounter.GetVar("japanese") == true then
    messages = {
      comments = {"[font:det_jp]キャラは\rあなたがよけるのをみてわらった.", "[font:det_jp]キャラは\rつかれたようにみえない.", "[font:det_jp][color:ff0000]なにかがかのじょに\rちからをかしているようだ.", "[font:det_jp]つみのいしきは\rすでにきえさっている."},
      commands = {"[font:det_jp]ぶんせき","[font:det_jp]いのる","[font:det_jp]セーブ","[font:det_jp]リセット"},
      name = "[font:det_jp]キャラ ドリーマー",
      check = {"[font:det_jp]キャラ ドリーマー  LV ?\nドリーマーけのおかげで\rいきのびた しにぞこない.","[font:det_jp][color:ff0000]すでに,まもってくれる\rモンスターはいない."},
      currentdialogue = {
        "[font:det_jp_mini]ハロー.",
        "[font:det_jp_mini]けっきょく,\nボクらのルールに\nしたがうことに\nしたんだね.",
        "[font:det_jp_mini]いまさら,\nどうしてだい?",
        "[font:det_jp_mini]たくさんのじかんじくで,\nだれもころさずに\nさいこうの\nエンディングに\nたどりついたのに.",
        "[font:det_jp_mini]'ころすか、ころされるか.'\nたしかにそう\nいいつづけてきたさ.",
        "[font:det_jp_mini]でも...\nあんなエンディングを\nしってしまったら...\nねぇ.",
        "[func:CharaHead,chara/closedhead][noskip]",
        "[font:det_jp_mini](ためいき)",
        "[font:det_jp_mini]そうだね,アズ.\nこのニンゲンが\n'てんし'だったんだ.",
        "[font:det_jp_mini]てんしは\nてんしでも\n'し'をもたらす\n'てんし'だったけど.",
        "[func:CharaHead,chara/head][noskip]",
        "[font:det_jp_mini]まぁいいか.\nところで,\nきょうは\nサイアクなひじゃないか?",
        "[font:det_jp_mini]とりはしんで,\nはながかれていき,\nまうのはちりばかり.",
        "[font:det_jp_mini]こんなひには,\nボクらのような\nにんげんは...",
        "[font:det_jp_mini]せいぜい\nたのしもうじゃないか",
        "[font:det_jp_mini][color:ff0000][effect:rotate][noskip][voice:v_floweymad][func:CharaHead,chara/madhead][func:CharaBody,chara/body]はじめようか,\nもうひとりの\nさつじんきさん?",
        "[func:State,DEFENDING][func:Autophobia][noskip][func:CharaHead,chara/head]",
      },
      c0 = {"[font:det_jp_mini]なにをしているんだ?\n[font:det_jp_mini]あてられるか,\nためしてみなよ."},
      c1 = {'[font:det_jp_mini]なにを\nおどろいているんだい?\nわざわざくらうために\nつったってるやつなんて\nいないだろ?'},
      c2 = {'[font:det_jp_mini]いつもおもってたんだ.\nなんできみは\nみんなにやさしく\nありつづけられるのかって.'},
      c3 = {'[font:det_jp_mini][func:CharaHead,chara/closedhead]きみのような\nやさしいひとは\nはじめてだったんだ.','[font:det_jp_mini][func:CharaHead,chara/doubthead]ま,けっきょくきみも\nやつらとおなじだった\nみたいだけど.'},
      c4 = {'[font:det_jp_mini][func:CharaHead,chara/head]でも,かんがえてみれば\nとうぜんか.','[font:det_jp_mini]ほんとうに\nやさしいひとは,\nリセットなんて\nしないだろうし.'},
      c5 = {'[font:det_jp_mini]そう,リセットだ.\nボクがしらないとでも\nおもったのかい?','[font:det_jp_mini]きみがじかんじくを\nすきかってに\nいじっていたこと.'},
      c6 = {'[font:det_jp_mini]きみがなんにんめかは\nしらないけど.\nでも,なんどころしても\nきみはやってくる.','[font:det_jp_mini][func:CharaHead,chara/madhead]きみがいるかぎり,\nボクらに\nほんとうのへいわは\nおとずれないんだ.'},
      c7 = {'[font:det_jp_mini]きみにわかるのかな?\nきょうきのしはいが\nおわった よろこび.','[font:det_jp_mini][func:CharaHead,chara/closedhead]そして...','[font:det_jp_mini][func:CharaHead,chara/downhead]すべてが\nなかったことになった\nあの ぜつぼう.'},
      c8 = {'[font:det_jp_mini][func:CharaHead,chara/downhead]ボクのケツイではリセット\nすることはできない.\nただ,きえていく\nじかんじくのきおくが\nのこされるだけ.','[font:det_jp_mini]もちろんこんなこと,\nだれにもいえない.','[font:det_jp_mini][func:CharaHead,chara/head]ボクがいったい,\nどれほど\nくるしんだとおもう?'},
      c9 = {'[font:det_jp_mini][func:CharaHead,chara/downhead]それでも...','[font:det_jp_mini]それでも,きみが\nみんなにやさしく\nしていたから,\nめをつむろうとおもった.','[font:det_jp_mini][func:CharaHead,chara/truemadhead]そのけっかが,\nこのザマだ.','[font:det_jp_mini][color:ff0000]まんぞくか?\nぼくらをもてあそんで.'},
      c10 = {'[font:det_jp_mini]まあ,きみのかんがえは\nどうでもいいんだ.\nどうせ,きいてもりかい\nできないだろうし.','[font:det_jp_mini]だいじなのは,\nきみがなんども\nみんなのしあわせを\nうばってるってことだ.','[func:CharaHead,chara/closedhead]...','[func:CharaHead,chara/head][font:det_jp_mini]...ひとつ,\nなつかしいはなしをしよう.','[font:det_jp_mini]スノーフルの\nとびらのはなし...\nいや,これはなんども\nはなしたか.','[font:det_jp_mini]でも...\n"これ"はしらないだろ?'},
      c11 = {'[font:det_jp_mini]おどろいてくれたかな?\nいせきにいたころ,\nパピルスにおそわったんだ.','[font:det_jp_mini]もっとも,\nかれはこのちからを\nきみをまもるために\nつかってほしかった\nみたいだけど.','[font:det_jp_mini][func:CharaHead,chara/winkedhead]どうせ,やくそくは\nなんどもやぶってる.\nこんかいばかりは,\nえんりょしないよ...'},
      c12 = {'[font:det_jp_mini][func:CharaHead,chara/closedhead]いせきが\nなつかしいな...\nみんなのこうげき\nひとつひとつ,\nいまでもおもいだせる.','[font:det_jp_mini]なかでも,かのじょは...\nアルフィーは\nひとすじなわでは\nいかなかった.','[font:det_jp_mini]もう\nたたかえないのが\nざんねんで\nしかたないよ...'},
      c13 = {'[font:det_jp_mini]あー,ごめん.\nおもいでにひたって\nきみのことを\nわすれるところだった.','[font:det_jp_mini]...\nなんてね,\nじょうだんだ.','[font:det_jp_mini][func:CharaHead,chara/madhead]みんなをきずつけた\nちょうほんにんを\nわすれるわけ\nないだろ?'},
      c14 = {'[font:det_jp_mini]もちろん,\nそんなことは\nボクいがい\nだれもおぼえてない.','[font:det_jp_mini][func:CharaHead,chara/downhead]だからこそ,\nボクはきみを\nゆるせないんだよ.','[font:det_jp_mini]アズがどれほど\nちじょうに\nいきたがってたか\nしってるか?','[font:det_jp_mini]ちじょうにでたとき,\nアズはいつも\nめをかがやかせて\n"あのまるいものは\nなんだ?!"ってきくんだ.','[font:det_jp_mini]そこでボクが,\n"あれがたいようだ"\nってかえすんだ.','[font:det_jp_mini]つぎのひには,\nかれはスノーフルの\nぼくのへやの\nとびらをたたいて\nこういうんだよ.','[font:det_jp_mini]"おきろ!\nつよくならねば\nちじょうには\nでられないぞ!"'},
      c15 = {'[font:det_jp_mini]ホント,\nむなしくなるよ.\nこんなことばっか\nおこってるんだから\nたまったもんじゃない.','[font:det_jp_mini]そのうえ,\nこんかいのけつまつは\nこれときた.\nまいっちゃうのも\nむりないだろ?','[font:det_jp_mini]...ところで,\nアズを,\nボクのおとうとを\nころしたのは\nせいとうぼうえいか?','[font:det_jp_mini]たしかにイカレたこさ.\nでも,どうじにピュアで\nほんとにひとを\nころすなんてむりだ.','[font:det_jp_mini][func:CharaHead,chara/madhead]いまさら,うそなんて\nつかなくていい.[color:ff0000]\nじひもなく\nむぞうさにころした.\nちがうか?'},
      c16 = {'[font:det_jp_mini]きみのもくてきは\nなんなんだ?\nなんどくりかえしても\nかわらないボクらに\nあいそがつきた?','[font:det_jp_mini]それとも,ただ\nじぶんのちからを\nこじしたい\nだけなのか?','[font:det_jp_mini][func:CharaHead,chara/doubthead]...いや,ちがうな.\nたんなるこうきしん.\nそれがきみの\nケツイのもとだ.\nちがうか?'},
      c17 = {'[font:det_jp_mini]ならきみがボクの\nともだちをころした\nってのは, もう\nもんだいじゃない.','[font:det_jp_mini]きみがここで\nたのしみつづける\nかぎり, どうせみんな\nよみがえるんだ.','[font:det_jp_mini][func:CharaHead,chara/closedhead]だからいま,\nボクがしなきゃ\nいけないのは...','[font:det_jp_mini][func:CharaHead,chara/head]きみがにどと\nここにきたいと\nおもえないように\nすることさ!'},
    }
  else
    messages = {
      comments = {"Chara laughed \rlooking you're dodging.", "Chara doesn't looks tired.","[color:ff0000]It seems \rsomething is helping her.","The guilt is already\rgone."},
      commands = {"Check","Pray","Save","Reset"},
      name = "Chara Dreemurr",
      check = {"Chara Dreemurr  LV ?\nShe survived this world\r thanks to Dreemurr family.","[color:ff0000]Now, No one would protect her."},
      currentdialogue = {
        "Howdy.",
        "So, finally, \nyou accepted \nour rule.",
        "Why did you choose \nthat way now?",
        "Many other timelines,\nyou showed us \nawesome endings,\nwithout killing.",
        "That's true \nwe believed \nthe motto that \n'It's kill or be killed'.",
        "But...\nonce see that \npeaceful ending...",
        "[func:CharaHead,chara/closedhead][noskip]",
        "*sigh*",
        "Yes, Rei...\nthey're angel.",
        "The angel \ngiving us a DEATH...",
        "[func:CharaHead,chara/head][noskip]",
        "By the way, it's a\nterrible day outside.",
        "Birds are dying, \nflowers are withering, \ndusts are scattering...",
        "On days like these, \nhumans like us...",
        "have a GREAT TIME.",
        "[color:ff0000][effect:rotate][noskip][voice:v_floweymad][func:CharaHead,chara/madhead][func:CharaBody,chara/body]THEN, SHALL WE PLAY, \nANOTHER KILLER?",
        "[func:State,DEFENDING][func:Autophobia][noskip][func:CharaHead,chara/head]",
      },
      c0 = {"Hey, \nwhat are you doing?\nHit me \nif you're able."},
      c1 = {'Why do you \nget surprised?\nNo one would \nstand there \nand take it.'},
      c2 = {'Always wondered \nwhy you can keep on\nbeing merciful \nfor everyone.'},
      c3 = {"[func:CharaHead,chara/closedhead]I never met humans\nlike you, so \nI couldn't understand.","[func:CharaHead,chara/doubthead]Well, finally\nyou're same as them,\nthough."},
      c4 = {"[func:CharaHead,chara/head]Come to think of it,\nit's not strange.","Heartful people \nwouldn't do RESET, \nwould they?"},
      c5 = {"Yes, RESET.\nYou think \nI don't know that?","That you abused\ntimelines."},
      c6 = {"I don' know \nwhat number you are, \nbut I know you'll back \neven if I kill you.","[func:CharaHead,chara/madhead]With YOU,\nwe can't be \nhappy anymore."},
      c7 = {"You can't understand\nthese feelings.","[func:CharaHead,chara/closedhead]Happiness when crazy\nrule disappeared.\nand...","[func:CharaHead,chara/madhead]Despair when I \nsuddenly understand\nall of them were\nLOST."},
      c8 = {"[func:CharaHead,chara/downhead]My determination is\nnot enough to RESET.\nOnly can keep \nmemories about \ndisappearing timelines.","Of course,\nI can't rely on \nanyone.","[func:CharaHead,chara/head]Can you see\nhow much I struggled?"},
      c9 = {'[func:CharaHead,chara/downhead]Nevertheless...','Nevertheless, as you\nkeep being kind,\nI decided to\noverlook your fault.',"[func:CharaHead,chara/truemadhead]And...\nyou know the result.","[color:ff0000]You satisfied\nfooling with us?"},
      c10 = {"Well, your thought is \nnot important.\nEven if I heard it,\nI shouldn't be able to\nunderstand it.","The importance is...\nyou're destroying\ntheir happiness\nfor a long time.","[func:CharaHead,chara/closedhead]...","[func:CharaHead,chara/head]...By the way,\nhere's a \nnostalgic story.","Door in Snowdin...\nno, I told you it \nmany time.","But...you don't\nknow 'THIS'."},
      c11 = {"Surprised by this?\nwhen I lived in Ruins,\nPapyrus taught me \nthis.","Though, he wanted me\nto use this power for\nprotect you.","[func:CharaHead,chara/winkedhead]Anyway, I broke the \npromise many times...\nThis time, I won't\nbother myself to\nuse this power!"},
      c12 = {"Oh, dear days \nin Ruins...\nI still remember\ntheir attack\none by one.","Above all, she...\nAlphys weren't dealt with\neasily.","I regret at\nthat I cannot \nfight against\nher anymore..."},
      c13 = {"Ah, it wasn't good \nduring fight\nto indulge in\nmemories and \nforget about you.","...\nwell, it's joke.","[func:CharaHead,chara/madhead]Who will forget about\nYOU, who hurt\neveryone?"},
      c14 = {"Of course, nobody\nremember except me.","[func:CharaHead,chara/downhead]That's why I can't\nforgive you.","Do you know\nhow eager Rei was\nto go to\nthe surface?","When we get to the\nsurface, he always \nsay:'What's that \nround thing?!' \nwith shining eye.","Then I answer,\n'That's the SUN.'","On the next day,\nknocking the door\nof my room \nat Snowdin,\nhe says...","'Get up!\nYou must be stronger\nto go to \nthe surface!'"},
      c15 = {"It makes me really \nvoid. When this \nkind of thing \nhappens all the time,\nI can't stand it.","Not only that, this \ntime you reached\nthe ending like this.\nIt's not strange\nI got exhaused,right?","...By the way,\nwas it a \nself-defendence\nyou killed Rei,\nmy sweet brother?","You know he's crazy...\nbut also pure \nso that he couldn't \nkill humans.","[func:CharaHead,chara/madhead]Now you needn't lie.\n[color:ff0000]YOU killed him \nwith NO MERCY.\nDIDN'T YOU?"},
      c16 = {"What's your purpose?\nDisgusted to us \nafter we didn't \nchange in \nevery timeline?",'Or, you just\nwanna show off \nyour power?',"[func:CharaHead,chara/doubthead]...No,it's not. Just for \nyour curiosity. \nThat's the root of \nyour determination. \nIsn't it?"},
      c17 = {"In that case,\nit dosen't matter \nanymore\nyou killed my friends.","As long as \nyou have fun with\nthis world, they can\ncome back anyway.",'[func:CharaHead,chara/closedhead]So, what I have to\ndo now is...',"[func:CharaHead,chara/head]Make you never \nwant to come back\nhere again!"},
    }
  end

  comments = messages.comments --コメントのリスト
  commands = messages.commands --ACT時のコマンド
  name = messages.name --モンスターの名前
end

SetLang()

cancheck = false --falseの時デフォルトのCHECKを削除する

sprite = "null" --スプライトの画像　
dialogbubble = "rightwide" --吹き出しの形
dialogueprefix = "" -- モンスターのテキストの初めに挿入

hp = 2000
atk = 1
def = 99
xp = 49999
gold = 0

turn = 0 --攻撃された回数でターンを管理
prayed = 0 --回復回数の計測

if Misc.FileExists('User/savedata') then
  local save = Misc.OpenFile('User/savedata','r')
  turn = tonumber(save.ReadLine(1))
  prayed = tonumber(save.ReadLine(3))
end

randomdialogue = {"[next]"}

if not Misc.FileExists('User/savedata') then
  -- currentdialogue = messages.currentdialogue
  currentdialogue = messages.c17
end

function HandleAttack(damage)
-- プレイヤーが攻撃したとき
  if damage == -1 then
    Encounter.SetVar("nextwaves",{"default"})
    currentdialogue = messages.c0
  else
    turn = turn + 1
    Backing()
    --turnの値によってメッセージを変える
    if turn == 1 then
      Encounter.SetVar("nextwaves",{"1"})
      currentdialogue = messages.c1 --何かしたとき吹き出しに特別に表示されるテキスト
    elseif turn == 2 then
      Encounter.SetVar("nextwaves",{"2"})
      currentdialogue = messages.c2 --何かしたとき吹き出しに特別に表示されるテキスト
    elseif turn == 3 then
      Encounter.SetVar("nextwaves",{"3"})
      currentdialogue = messages.c3
    elseif turn == 4 then
      Encounter.SetVar("nextwaves",{"4"})
      currentdialogue = messages.c4
    elseif turn == 5 then
      Encounter.SetVar("nextwaves",{"5"})
      currentdialogue = messages.c5
    elseif turn == 6 then
      Encounter.SetVar("nextwaves",{"6"})
      currentdialogue = messages.c6
    elseif turn == 7 then
      Encounter.SetVar("nextwaves",{"7"})
      currentdialogue = messages.c7
    elseif turn == 8 then
      Encounter.SetVar("nextwaves",{"8"})
      currentdialogue = messages.c8
    elseif turn == 9 then
      Encounter.SetVar("nextwaves",{"9"})
      currentdialogue = messages.c9
    elseif turn == 10 then
      Encounter.SetVar("nextwaves",{"10"})
      currentdialogue = messages.c10
    elseif turn == 11 then
      Encounter.SetVar("nextwaves",{"11"})
      currentdialogue = messages.c11
    elseif turn == 12 then
      Encounter.SetVar("nextwaves",{"12"})
      currentdialogue = messages.c12
    elseif turn == 13 then
      Encounter.SetVar("nextwaves",{"13"})
      currentdialogue = messages.c13
    elseif turn == 14 then
      Encounter.SetVar("nextwaves",{"14"})
      currentdialogue = messages.c14
    elseif turn == 15 then
      Encounter.SetVar("nextwaves",{"15"})
      currentdialogue = messages.c15
    elseif turn == 16 then
      Encounter.SetVar("nextwaves",{"16"})
      currentdialogue = messages.c16
    elseif turn == 17 then
      Encounter.SetVar("nextwaves",{"17"})
      currentdialogue = messages.c17
    end
  end
end

function BeforeDamageCalculation()
  -- ダメージ計算の前にダメージを0にする
  SetDamage(0)
  Dodging()
end

function HandleCustomCommand(command)
-- ACTのコマンドの動作
  Encounter.SetVar("nextwaves",{"default"})
  if command == "CHECK" or command == "[FONT:DET_JP]ぶんせき" then
    BattleDialog(messages.check)
  elseif command == "PRAY" or command == "[FONT:DET_JP]いのる" then
    if prayed == 0 then
      Player.Heal(20)
      if Encounter.GetVar("japanese") == true then
        BattleDialog({'[font:det_jp]あなたはいのった. \n20HP かいふくした.'})
      else
        BattleDialog({'You prayed. You recovered 20 HP.'})
      end
    elseif prayed == 1 then
      Player.Heal(20)
      if Encounter.GetVar("japanese") == true then
        BattleDialog({'[font:det_jp]あなたはいのった. \n20HP かいふくした.'})
      else
        BattleDialog({'You prayed. You recovered 20 HP.'})
      end
    elseif prayed == 2 then
      Player.Heal(40)
      if Encounter.GetVar("japanese") == true then
        BattleDialog({'[font:det_jp]あなたはいのった. \n40HP かいふくした.'})
      else
        BattleDialog({'You prayed. You recovered 40 HP.'})
      end
    elseif prayed == 3 then
      Player.Heal(40)
      if Encounter.GetVar("japanese") == true then
        BattleDialog({'[font:det_jp]あなたはいのった. \n40HP かいふくした.'})
      else
        BattleDialog({'You prayed. You recovered 40 HP.'})
      end
    elseif prayed == 4 then
      Player.Heal(60)
      if Encounter.GetVar("japanese") == true then
        BattleDialog({'[font:det_jp]あなたはいのった. \n60HP かいふくした.'})
      else
        BattleDialog({'You prayed. You recovered 60 HP.'})
      end
    elseif prayed == 5 then
      Player.Heal(60)
      if Encounter.GetVar("japanese") == true then
        BattleDialog({'[font:det_jp]あなたはいのった. \n60HP かいふくした.'})
      else
        BattleDialog({'You prayed. You recovered 60 HP.'})
      end
    elseif prayed == 6 then
      Player.Heal(80)
      if Encounter.GetVar("japanese") == true then
        BattleDialog({'[font:det_jp]あなたはいのった. \n80HP かいふくした.'})
      else
        BattleDialog({'You prayed. You recovered 80 HP.'})
      end
    elseif prayed == 7 then
      Player.Heal(80)
      if Encounter.GetVar("japanese") == true then
        BattleDialog({'[font:det_jp]あなたはいのった. \n80HP かいふくした.'})
      else
        BattleDialog({'You prayed. You recovered 80 HP.'})
      end
    elseif prayed == 8 then
      Player.Heal(99)
      if Encounter.GetVar("japanese") == true then
        BattleDialog({'[font:det_jp]あなたはいのった. \nHPが ぜんかいふくした.'})
      else
        BattleDialog({'You prayed. Your HP maxed out.'})
      end
    elseif prayed >= 9 then
      if Encounter.GetVar("japanese") == true then
        BattleDialog({'[font:det_jp][color:ff0000]たくさんだ!　\nもう　じゅうぶんいのっただろ!'},{"あなたはいのろうとした.\nが、すでにいのりはつきていた。"})
      else
        BattleDialog({"[color:ff0000]That's enough! Prayed too much!","You tried to pray.\nBut no prayers left."})
      end
    end
    prayed = prayed + 1
  elseif command == "SAVE" or command == "[FONT:DET_JP]セーブ" then
    Audio.PlaySound('saved')
    if not Misc.DirExists('User') then
      Misc.CreateDir('User')
    end
    local save = Misc.OpenFile('User/savedata','w')
    if not Misc.FileExists('User/savedata') then
      save.Write('\n\n\n\n\n\n\n\n\n\n\n\n\n')
    end
    save.ReplaceLine(1,tostring(turn)) --savefileの一行目をターンにする
    save.ReplaceLine(2,tostring(Player.hp)) --savefileの二行目をHPにする
    save.ReplaceLine(3,tostring(prayed)) --savefileの三行目を回復回数にする
    local items = Inventory.ItemCount -- アイテムの数を記録し名前を続ける
    save.ReplaceLine(4,tostring(items))
    for i=1,items do
      save.ReplaceLine(4+i,tostring(Inventory.GetItem(i)))
    end
    save.ReplaceLine(13,tostring(Encounter.GetVar('noob')))
    save.ReplaceLine(14,tostring(Encounter.GetVar('japanese')))

    if Encounter.GetVar("japanese") == true then
      BattleDialog({'[font:det_jp][color:ff0000]ひとり のこっている.\n[color:ffffff]ケツイが みなぎった.'})
    else
      BattleDialog({"[color:ff0000]One left.\n[color:ffffff]You filled with DETERMINATION."})
    end
  elseif command == "RESET" or command == "[FONT:DET_JP]リセット" then
    if Misc.FileExists('User/savedata') then
      local save = Misc.OpenFile('User/savedata','w')
      save.Delete()
    end
    Misc.DestroyWindow()
  end
end

-- テキストコマンド用
function Autophobia()
  Audio.Pitch(1)
  Audio.LoadFile('mus_aph')
end

function Angelovania()
  Audio.Pitch(1)
  Audio.LoadFile('mus_ang')
end

function Azimuth()
  Audio.Pitch(1)
  Audio.LoadFile('mus_azi')
end

function CharaHead(text)
  SetHead(text)
end

function CharaBody(text)
  SetBody(text)
end