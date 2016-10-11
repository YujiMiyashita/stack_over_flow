最初に空のWIPのプルリクエスト作ってください。  

空のコミットの作り方
```
git commit --allow-empty -m "【WIP】 作成する機能の概要"
```

空コミットを作ったらgithubへpush
```
git push origin issues/#イシュー番号
```

プルリクエストには以下の内容を書いてください。

## 実装手順
例) blog機能を作る  
- [ ] blogのテーブル定義を作成する
- [ ] scaffoldでblogを作成する
- [ ] 日本語化する
- [ ] 項目に必須チェックを入れる

## 質問事項
* 確認しておきたいこと
* 疑問点

```ruby
if 1つ以上commitがある
  if toggleボタンを止めた時 || pushしたくなったら
    githubにbranchをpushする
  end
end
```