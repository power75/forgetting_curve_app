# サービス名：『Wisdom Whistle』

# 目次
- [サービス概要](#サービス概要)
- [サービスURL](#サービスurl)
- [サービスへの思い](#サービスへの思い)
- [機能紹介](#機能紹介)
- [技術構成について](#技術構成について)
  - [使用技術](#使用技術)
  - [ER図](#er図)
  - [画面遷移図](#画面遷移図)<br>
<br>

# サービス概要
このサービスは、エンジニアが日々学習した内容を記録し、その記録をもとに最適な復習タイミングを提案し、通知します。 さらに、ユーザー自身が作成した小テストを未来の自分に対して実施することが可能です。 これにより、学習の定着を助け、エンジニアのスキル向上をサポートします。通知はLINE、メールを通じて行われます。

# サービスURL
### https://wisdomwhistle.com<br>
<br>

# サービスへの思い
毎日自分で学習記録を付けていましたが、復習するタイミングを掴めなかったり、 どのように復習しようかわからず、有効活用できずにもったいないと感じたため、 
LINEという毎日見るであろうサービスを通して最適な復習タイミングで通知してくれるアプリがあれば 学習に役立つと考えたためこのサービスを作りました。

# 機能紹介
| ユーザー登録 / ログイン |
| :---: | 
|![image](https://github.com/user-attachments/assets/f2e37e15-5fa9-48d4-b5d7-92b232bb9d22)|
|![image](https://github.com/user-attachments/assets/515d7417-925b-4d3a-91f7-6de82f767d24)|
| まずはユーザー登録を行いましょう。デフォルトではユーザー登録時のメールアドレスに学習記録が通知されます。 |
| また、LINEでユーザー登録することも可能です。登録後プロフィールから通知方法をLINEに変更することで、あなたのLINEへ学習記録が通知されとても便利です。 |
<br>

| 学習記録作成 / 通知 |
| :---: | 
|![image](https://github.com/user-attachments/assets/f58ec6ae-354c-4e75-a533-fe1f7097c5bb)|
| 次は学習記録を作成しましょう。画像やタグも設定できます。|
| ![image](https://github.com/user-attachments/assets/fa8f90d7-734c-4c58-b1a0-011e1c60a2d8)|
| 通知時に覚えていてほしい内容をQuiz詳細に記載していきましょう。|
<br>

| Quizの実施 |
| :---: | 
|![image](https://github.com/user-attachments/assets/7658987a-2843-4dc3-bffe-d9f7eafd2f98)|
| Quizが通知されたら回答してみましょう。|
|![image](https://github.com/user-attachments/assets/a0845c08-f86c-4cb3-8321-6e691d810c92)|
|内容が定着したと思ったら「はい」そうでなければ「いいえ」をクリックします。Xで復習したことをシェアできます。|
|「はい」をクリックすると今後通知されなくなります。(戻すこともできます。)|

# 技術構成について

## 使用技術
| カテゴリ | 技術内容 |
| --- | --- | 
| サーバーサイド | Ruby on Rails 7.0.8・Ruby 3.2.2 |
| フロントエンド | Ruby on Rails・React(予定) |
| CSSフレームワーク | Bootstrap |
| Web API | LINE Messaging API |
| データベース | PostgreSQL |
| アプリケーションサーバー | Render.com |
| バージョン管理ツール | GitHub |
<br>

## ER図
https://mermaid.live/edit#pako:eNqtVU2TmzAM_Ssen7MZSBaScG2nl7303MmMxwUFPAs2lcVuPv97DSFZFkiz3ZZTLD3J70mWcuCxSYBHHPCrkinKYq2Z-yoLaNnx-PBgDiwHiVrpVGTKkkEFlkUsRpAEdgT-q1L7_R2MNqQ2KpakjK6RCDGol1GorCgDTR1wJh3ujByhVocdjx0WDfwG-GSaO0imvcSX8DZbn28KGvCsrUv5cD7U30-VKk1MJez705vVEjoCTMsCBkYopMoH1hh3JUEiSmntq8FkALAyp4ERwQJdYwSZZ9BvoMQxJ1XAKEzAtlTOISTdj2g4C-v68w7ulEMKyGQcg7UiNpUDkBG96FKmMAwqETaA6DR3qy4KoMwM5edKg6irL1TrPP3hcXy0QaQo71Aj2BKLjSOoh7VWxaiMzFQ4tDalGJotSarsgFyri3176km7PM__qqexWlmUOQip7Stgz9fQ6Xvae3vF3nVpf0RRM4J_Pz-3mr0TLqF7b3k7sofPEq7TjPF9vxHuEr8hv-OqW9p3jXfvOozv5qO29jj2V-e_sGyplGheVNLtf-uoBuNXvy8Z02e3YvPiCrc-rtN14hOeokp4RFjBhBeAbv24I29uWHOn1mXgkfuZSHxe87WuY0qpfxhTXMLQVGnGo43MrTtVZV249s_vCgHtNH6pZ5VHvhcETRIeHfjWnRerabD057Mw9INluApWE77j0dyb-qtw8ejPFvNg7vvhacL3zbXedBkG3tIPg6U3W828x_D0GyiEZW4
<br>
## 画面遷移図
https://www.figma.com/board/Qw5ZfzCLhrgKTUPI6UlgZN/%E7%94%BB%E9%9D%A2%E9%81%B7%E7%A7%BB%E5%9B%B3?node-id=0-1&t=MY01kUjn07LbjsxC-1

