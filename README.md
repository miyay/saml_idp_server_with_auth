# Saml IdP Server

## Getting Started

1. `git checkout https://github.com/miyay/saml_idp_server.git`
2. `bundle`
3. `bundle exec rails s`

## Usage

* get /admin
 * ユーザー管理画面
 * RailsAdmin
* get /saml/auth
 * samlのリクエストを最初に受け、認証画面を表示する
 * クエリパラメーターにSAMLRequest=で認証要求メッセージを受ける
* post /saml/auth
 * 上記からログインを試みた際に叩かれる
 * 認証が成功すれば認証応答メッセージを持って認証要求メッセージに含まれたSPのエンドポイントにredirectする

### Testing

* SAMLの挙動を見る
 1. `bundle exec rails r script/test_request.rb`で認証要求メッセージが出力される
     * SPのエンドポイント(リダイレクト先)は適時指定すること
 2. http://localhost/に上記出力内容を貼り付け、アクセス
 3. Deviseの認証画面が表示されるため、サインアップもしくはログインする
 4. 認証応答メッセージを持って指摘リダイレクト先へリダイレクト
