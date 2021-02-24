# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| name               | string | null: false |
| officer            | string | null: false |
| encrypted_password | string | null: false |
| email              | string | null: false |
| authentication_key | string | null: false |

### Association
has_many: category_users
has_many: categories, through: category_users

## banks テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| name   | string | null: false |

### Association
has_many: bank_categories
has_many: categories, through:bank_categories

## categories テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| subject  | string | null: false |
| content  | string | null: false |

### Association

has_many: bank_categories
has_many: banks
has_many: users

## category_users テーブル
| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| user     | references | null: false, foreign_key: true |
| category | references | null: false, foreign_key: true |

### Association
belongs_to :category
belongs_to :user

## category_bankings テーブル
| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| banking  | references | null: false, foreign_key: true |
| category | references | null: false, foreign_key: true |

### Association
belongs_to :category
belongs_to :banking
