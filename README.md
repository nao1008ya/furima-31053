# アプリ名
フリマアプリ

# アプリケーション概要
テックキャンプの最終課題にて作成した
フリーマーケットのアプリケーションを作成しました。ユーザーを登録すると商品を出品できるようになります。自身が出品した商品は、編集と削除をすることができます。(複数画像投稿機能実装の為、編集ができなくなっています）他のユーザーが出品した商品は、登録したクレジットカードを用いて購入することができます。

## 利用方法
まずはユーザー登録を実施します。ログイン状態で商品を出品することができます。出品しである商品購入する際は、出品者以外のユーザーである必要がございます。購入はクレジットカードを事前に登録して行います。登購入時に登録されていない場合は自動的にクレジットカード登録画面に推移します。一度購入した商品は購入できない仕様になっています。

# URL

## Heroku
https://furima-31053.herokuapp.com/

# テスト用アカウント
 - Email:test@gmail.com
 - Password:test0000

# Basic認証
 - ID: admin
 - Pass: 2222

# 制作背景
テックキャンプでの最終課題終了後に追加実装を行うことで、新たな技術を習得し、自身のオリジナルアプリにも利用できる機能を実装致しました。

## アプリケーションの課題と解決策
 - 出品画像添付時に画像データが表示されない為、間違った画像を投稿しない為にもプレビュー機能の実装が必要と考えました。
 - 出品画像の投稿が1枚だけでは商品の詳細がわかりにくい為、複数枚投稿できる機能が必要と考えました。
 - エラーメッセージの表記が英語の為わかりやすい日本語にする必要があると考えました。
 - クレジットカードを毎回入力するのは不便な為、登録機能があると便利だと考えました。
 - 出品時にタグがあると検索や確認時にもよりわかりやすくなる為便利だと考えました。
 - 検索時に細かな検索ができればより便利に利用できると考えました。
 - ページ推移の際にパンくず機能があればもっと便利になると考えました。
 - ユーザー新規登録時にページ推移、一時保存があると便利だと考えました。
 - ユーザー登録時にgoogleアカウントから登録できると便利だと考えました。
 - 出品商品にコメント投稿機能があるともっと便利になると考えました。

# DEMO

## プレビュー機能の実装を行いました。
## 画像複数枚投稿機能の実装を行いました。
<img width="737" alt="画像複数枚投稿" src="https://user-images.githubusercontent.com/72249406/99871118-5c58e180-2c1b-11eb-9708-eabaa5f1d9c7.png">
出品時にファイルを選択するをクリックするとJavaScriptを用いて画像データーが表示される仕様になっています。
1枚の画像を更新すると自動的に次の画像更新用のファイルを選択するコマンドが表示されるようになっている。
こちらの機能実装により間違った画像の投稿もなくなり、商品の内容がよりわかりやすく、イメージしやすくなるようになりました。


## エラーメッセージを日本語で表記する為、rails-i18nのGemを導入しました。
![新規登録エラー画面](https://user-images.githubusercontent.com/72249406/99871559-29b0e800-2c1f-11eb-8196-3ddf677d051b.gif)
ユーザー新規登録時、商品出品時、商品購入時の入力エラーの際、エラーメッセージが日本語で表示されるように変更しました。
こちらの機能実装により、今までであればカラム名とviewファイルの名前を一致させることが大変でしたが、日本語表記にすることでどの入力欄にエラーが出ているのかがわかりやすくなりました。

## クレジットカードの登録機能を実装しました。
![クレジットカード登録](https://user-images.githubusercontent.com/72249406/99871565-39c8c780-2c1f-11eb-9b5f-cea8ee66573c.gif)
商品購入時に毎回クレジットカードの入力があることはユーザーへの手間が大きい為、Java Scriptとtokenを用いてクレジットカードの登録機能、登録したクレジットカードで購入する機能を実装しました。
こちらの機能実装により、ユーザーが快適に購入することが可能となりました。

## タグ付機能導入の為、tagテーブルとitemテーブルとをFromオブジェクトで纏めました。
![タグ機能実装](https://user-images.githubusercontent.com/72249406/99871576-49481080-2c1f-11eb-904d-8349f2cc57c0.gif)
商品にタグを自由に付けられればどのような商品なのかより正確に理解し、利用できるという観点からタグ付機能を導入致しました。
1度登録したタグは並行して用いられる、商品出品時に自動検索してくれるJava Script機能などを導入しました。

## 細かな検索をできるようにする為、ransackのGemを導入しました。
![ransack](https://user-images.githubusercontent.com/72249406/99871597-56fd9600-2c1f-11eb-9767-51365a25ffc6.gif)
商品検索をより細かく実施できるよう、ransackを用いて商品検索機能を実装しました。
検索内容は商品出品時に指定しているカラム名(ActiveHash)とユーザーのニックネームです。
細かく検索することで同じ出品者の商品を探すことや、カテゴリーや地域別などで探すことも可能となりました。

## パンくず機能実装の為、gretelのGemを導入しました。
![パンくず](https://user-images.githubusercontent.com/72249406/99871619-6d0b5680-2c1f-11eb-9e63-cb323c1b912c.gif)
自身が今、トップページからどの程度離れた画面まで推移しているかをよりわかりやすいものにする為にパンくず機能の実装を行いました。
これにより、いつでもトップページに戻ることが可能となりました。

## ユーザー登録時にウィザードの実装を行いました。
## ユーザー登録時に外部APIの設定(SNSアカウント認証)(google)で登録できるよう実装しました。
![googleアカウント登録](https://user-images.githubusercontent.com/72249406/99871671-b52a7900-2c1f-11eb-99e7-25f9e058b2f2.gif)
1度のページで纏めて登録することが大変なのでページを分けて登録できるウィザード機能を実装しました。
ユーザー登録時にgoogleのアカウントを用いれるとさらに便利になるという観点から外部APIの実装も行いました。
上記内容を実装することでユーザーはより便利に手軽にアカウント登録を行うことができるようになりました。

## コメント投稿機能実装しました。
![コメント機能](https://user-images.githubusercontent.com/72249406/99871906-3cc4b780-2c21-11eb-9a18-ceecd257c29d.gif)
商品に対してのコメント機能があればより購入時の不安や気になる点などを解決することができるのでコメント投稿機能を実装しました。ユーザー名も表示することにより誰がコメントしたのかも確認できるように実装しました。
より便利に実装する為にJava ScriptのCanel機能を用いて実装しました。
上記内容により、出品者、購入予定のユーザー、購入を検討しているユーザーが商品ページ内でやりとりや情報共有をすることが可能となりました。


# 工夫した機能
## ユーザー視点での開発
追加実装カリキュラムの内容を、フリマアプリに組み込む方法を考えたことです。特に、ユーザー視点を意識し取り組みました。
具体的には、クレジットカードの登録ページや詳細ページは、どのviewから推移できるようにするのかを考えました。その他にも、外部API機能をトップページに表示するかや、ユーザーログインと新規登録時にボタンを表示するかを考える等、機能面での使いやすさを考慮し開発を行いました。
## エラーの解決
いくつもの機能を実装する過程において、他の機能にエラーが発生したり、記述が変わってしまうことが多く、その1つ1つへの対処に苦労致しました。しかしながら、エラーを解消する練習の場と捉え、対応に向き合って参りました。
そこで、まずは自身の力で解消を試みました。具体的には、binding.pryを行い、現時点でのparamsのデータやerror.messageを確認しエラーの原因を探す等、試行錯誤し解決に努めました。

# 苦労した点
Formオブジェクトにおいて、viewファイルの記述が変わってしまう点に苦労しました。最初に指定していたモデル名はitemでしたが、tag機能実装の場面でFormオブジェクトを用いていました。モデル名やコントローラー上で定義されていた変数が変わると、必然的にviewファイルも変わってしまいます。追加実装のカリキュラムの練習用アプリケーションでは、Formオブジェクトではないため、Formオブジェクトが絡んでいるフリマアプリに落とし込むだけでも、大変苦労しました。しかしながら、実装を続けることで、より一層、Formオブジェクトへの理解が深まりました。複数の追加実装が加わると、必然と記述が長くなってしまうことから、短縮できないかを考える機会になりました。



# ローカルでの動作方法
rails _6.0.0_

# 使用技術(開発環境)

## バックエンド
Ruby, Ruby on Rails

## フロントエンド
HTML/CSS, Java Script

## データベース
MySQL,SequelPro

## インフラ
Heroku

## Webサーバー(本番環境)
Heroku

## アプリケーションサーバー

## ソース管理
GitHub,GitHubDesktop

##　テスト
RSpec

## エディタ
VSCode

# 課題や今後実装したい機能
追加実装したカリキュラムの中のCSSをフリマアプリに合わせられるように変更したいです。
複数枚画像投稿機能を実装しましたが編集機能が実装できていない為、更新する予定です。
ウィザード機能を実装しましたが、ユーザー登録機能のみを複数に分けましたので購入時の情報入力画面も新規登録時に登録できるような実装を予定しています。

# データベース設計
<img width="854" alt="ER図" src="https://user-images.githubusercontent.com/72249406/99870585-9d4ef700-2c17-11eb-9803-88b3ddcd559b.png">


# テーブル設計
## usersテーブル

| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| nickname           | string     | null: false |
| email              | string     | null: false |
| encrypted_password | string     | null: false |
| first_name         | string     | null: false |
| last_name          | string     | null: false |
| first_kana_name    | string     | null: false |
| last_kana_name     | string     | null: false |
| birthday           | date       | null: false |

### Association

- has_many :items
- has_many :buyers
- has_many :comments
- has_one :card, dependent: :destroy


## itemsテーブル

| Column              | Type       | Options     |
| ------------------- | ---------- | ----------- |
| title               | string     | null: false |
| catch_copy          | text       | null: false |
| price               | integer    | null: false |
| user                | references | null: false |
| category_id         | integer    | null: false |
| item_status_id      | integer    | null: false |
| shipping_fee_id     | integer    | null: false |
| prefecture_id       | integer    | null: false |
| shipping_fee_day_id | integer    | null: false |

### Association

- belongs_to :user
- has_one :buyer
- has_many :item_tag_relations
- has_many :tags, through: :item_tag_relations
- has_many :comments

## tagsテーブル

| Column | Type       | Options     |
| ------ | ---------- | ----------- |
| name   | string     | null: false |

### Association

- has_many :item_tag_relations
- has_many :items, through: :item_tag_relations

## items_tagテーブル

| Column | Type       | Options     |
| ------ | ---------- | ----------- |
| tag    | references | null: false |
| item   | references | null: false |

### Association

- belongs_to :tag
- belongs_to :item

## buyersテーブル

| Column | Type       | Options     |
| ------ | ---------- | ----------- |
| user   | references | null: false |
| item   | references | null: false |

### Association

- belongs_to :user
- belongs_to :item
- has_one :input_format

## input_formatsテーブル

| Column        | Type       | Options     |
| ------------- | ---------- | ----------- |
| postal_code   | string     | null: false |
| city          | string     | null: false |
| city_address  | string     | null: false |
| apartment     | string     |             |
| tel           | string     | null: false |
| buyer         | references | null: false |
| prefecture_id | integer    | null: false |

### Association

- belongs_to :buyer

## cardsテーブル

| Column         | Type       | Options     |
| -------------- | ---------- | ----------- |
| card_token     | string     | null: false |
| customer_token | string     | null: false |
| user           | references | null: false |

### Association

- belongs_to :user

## commentsテーブル

| Column | Type       | Options     |
| ------ | ---------- | ----------- |
| text   | text       | null: false |
| user   | references | null: false |
| item   | references | null: false |

### Association

- belongs_to :user
- belongs_to :items