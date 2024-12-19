## usersテーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| name               | string | null: false |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false |

### Association

- has_many :articles
- has_many :favorites
- has_many :favorite_articles, through: :favorites

## articlesテーブル

| Column  | Type       | Options     |
| ------- | ---------- | ----------- |
| theme   | string     | null: false |
| issue   | text       | null: false |
| measure | text       | null: false |
| result  | text       | null: false |
| user    | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many : favorites
- has_many :favorite_users, through: :favorites
- has_many : article_tags
- has_many :tags, through: :article_tags

## article_tags

| Column  | Type       | Options           |
| ------- | ---------- | ----------------- |
| article | references | foreign_key: true |
| tag     | references | foreign_key: true |

### Association

- belongs_to :article
- belongs_to :tag

### tagsテーブル
| Column | Type   | Options     |
| ------ | ------ | ----------- |
| name   | string | null: false |

### Association

- has_many :article_tags
- has_many :articles, through: :article_tags