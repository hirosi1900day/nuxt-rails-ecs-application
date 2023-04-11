| # | 目次 |
| ---- | ---|
| 1 | [bestpraとは](#bestpraとは) |
| 2 | [作成背景](#作成背景) |
| 3 | [インフラ構成図](#インフラ構成図) |
| 4 | [ER図](#er図) |
| 5 | [使用技術](#使用技術) |
| 6 | [機能一覧](#機能一覧) |
| 7 | [工夫した点](#工夫した点) |

<br />

# インフラ構成図
![インフラ構成図](/design/infra.svg)

<br />

# ER図
![ER図](/design/img/ER.png)

# 使用技術
| バックエンド
----|
| Ruby 3.1.2 |
| Rails 7.0.4 |
| MySQL 8.0.31|
| Nginx/puma |
| RoboCop |
| Rspec |
<br />

| フロントエンド
----|
| Nuxt.js 2.15.8(SPA mode)  |
| Vuetify 2.6.12 |
| axios |
| eslint/prettier(静的解析、フォーマッター) |
| Jest |
<br />


| インフラ
----|
| docker / docker-compose  |
| Circle CI(デプロイ完成後GitHub Actionsへ移行) |
| GitHub Actions |
| AWS (Route53,ALB,VPC,subnet,ECR,ECS,RDS,ACM,SSM,cloudWatch) |
| terraform(インフラをコード化) |
<br />


# 機能一覧
- JWT
  - 新規作成
  - ログイン機能
  - 簡易ログイン機能
  - ログアウト機能
  - サイレントリフレッシュ機能
- ユーザー
  - 閲覧
  - 編集
  - 削除
- フォローフォロワー機能
  - 閲覧
- 練習メニュの記事
  - 作成
  - 閲覧
  - 編集
  - 削除
  - いいね機能
- 練習メニュへのコメント
  - 作成
  - 削除
- 通知機能
  - 記事のいいね時
  - 記事のコメント時
  - フォロー時
- 検索
  - 記事のタイトル内容から検索
  - ラベルから記事を検索
  - タグから記事を検索
<br />
<br />

# 工夫した点
## バックエンド
- バックエンドとフロントエンドを完全に分離し、API通信を実装
- N+1問題を考慮した実装
- リアルなseedデータを作成
- Ckeditorから送られてくるデータをsanitize処理しxss対策を実施

<br />

## フロントエンド
<!-- - SEOや画面描写速度を考えてSSR(universal)モードを採用 -->
- 完全SPAで作成
- 学生やコーチなど幅広い年齢層でも使いやすいシンプルで分かりやすいUIを採用
- サイレントリフレッシュを使い、認証情報を永続化
- vuexを活用し、リアルタイムで画面に反映
- ログイン状態によった画面遷移を実施
- Ckeditorを使用してリッチテキストを使用
- 全てのページでレスポンシブデザインを実装
- aboutページを作成し、使い方や使ったイメージを想像できるように実装
- prettierを利用して、読みやすいコードを意識

<br />

## インフラ
- Dockerを採用することで複数人でも同じ環境を構築できるように
- Dockerと相性の良いAWS(ECS Fargate)を採用
- Circle CIにてCI/CDパイプラインを構築したがセキュリティリスクを考慮しGitHub Actionsへ移行
- GitHub Actionsを用いてCI/CDパイプラインを構築
- terraformによるインフラのコード化


<!--
ファイルの命名規則
・component   => PascalCase
・その他       => kebab-case
・DOM         => kebab-case

props => kebab-case ->:kebak-case props[pascalCase]
emit => kebab-case -> this.$emit('my-emit')
 -->