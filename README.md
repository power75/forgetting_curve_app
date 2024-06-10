■サービス概要
どんなサービスなのかを３行で説明してください。

このサービスは、エンジニアが日々学習した内容を記録し、その記録をもとに最適な復習タイミングを提案し、通知します。
さらに、ユーザー自身が作成した小テストを未来の自分に対して実施することが可能です。
これにより、学習の定着を助け、エンジニアのスキル向上をサポートします。通知は主にLINE、X、メールを通じて行われます。

■ このサービスへの思い・作りたい理由
このサービスの題材となるものに関してのエピソードがあれば詳しく教えてください。
このサービスを思いつくにあたって元となる思いがあれば詳しく教えてください。

毎日自分で学習記録を付けているが、復習するタイミングを掴めなかったり、
どのように復習しようかわからず、有効活用できずにもったいないと感じたため、
LINE,Xという毎日見るであろう媒体を通して最適な復習タイミングで通知してくれるアプリがあれば
学習に役立つと考えたため。

■ ユーザー層について
決めたユーザー層についてどうしてその層を対象にしたのかそれぞれ理由を教えてください。

ユーザー層はITエンジニアです。
理由：reminDOという似たサービスがあります。
そのサービスはエンジニア向けというよりは学生やもっと一般の方に向けて展開されているため、
本サービスではエンジニアでターゲットを限定していく。

■サービスの利用イメージ
ユーザーがこのサービスをどのように利用できて、それによってどんな価値を得られるかを簡単に説明してください。

毎日の学習記録を投稿していく掲示板のような機能になる。
学習記録を残すときにコアとなる内容についてユーザー自身が問題を作成し、
数日後通知し、サービスにアクセスしてもらい、記述式で小テストを実施する。

■ ユーザーの獲得について
想定したユーザー層に対してそれぞれどのようにサービスを届けるのか現状考えていることがあれば教えてください。
X、友人、知人

■ サービスの差別化ポイント・推しポイント
似たようなサービスが存在する場合、そのサービスとの明確な差別化ポイントとその差別化ポイントのどこが優れているのか教えてください。
独自性の強いサービスの場合、このサービスの推しとなるポイントを教えてください。

reminDOという似たサービスがあります。
英単語や読書の要点を暗記、記憶定着させるために忘却曲線を利用して忘れそうなときに通知してくれるサービスです。
非常に便利なサービスですが、ITエンジニアに向けた機能があるともっとよいと考えました。
(元々はreminDOと同じサービスを考えていたのですが、既に存在していたのでエンジニア向けに差別化を図ろうとした次第です。)
差別化ポイントとしては
・Githubとの連携
・コードブロックが使える。
・LINE,Xに通知する機能を付ける。
の3つを現在考えているところです。

■ 機能候補
現状作ろうと思っている機能、案段階の機能をしっかりと固まっていなくても構わないのでMVPリリース時に作っていたいもの、本リリースまでに作っていたいものをそれぞれ分けて教えてください。

MVPリリース
　ログイン
　掲示板に投稿する機能(テキスト、タグ、マークダウンによるコードブロック、画像、クイズ)
　投稿内容の通知機能

本リリース

■ 機能の実装方針予定
一般的なCRUD以外の実装予定の機能についてそれぞれどのようなイメージ(使用するAPIや)で実装する予定なのか現状考えているもので良いので教えて下さい。

LINE通知: LINE Messaging API

■ 技術選定
・開発環境
　Docker
・サーバーサイド
　Ruby on Rails
  Ruby
・フロントエンド
　Hotwire
・CSSフレームワーク
　Bootstrap
・WebAPI
　LINE Messaging API
・インフラ
　Fly.io
・データベース
　MySQL
・コードの記述
　マークダウンによるコードブロック

Figma:https://www.figma.com/board/Qw5ZfzCLhrgKTUPI6UlgZN/%E7%94%BB%E9%9D%A2%E9%81%B7%E7%A7%BB%E5%9B%B3?node-id=0-1&t=MY01kUjn07LbjsxC-1
