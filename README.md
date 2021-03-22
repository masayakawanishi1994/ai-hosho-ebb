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
has_many: contents

## banks テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| name   | string | null: false |

### Association
has_many: bank_categories
has_many: categories, through:bank_categories
has_many :contents

## categories テーブル

| Column   | Type         | Options     |
| -------- | ------------ | ----------- |
| subject  | string       | null: false |
| number   | numericality | null: false |

### Association
has_many :bank_categories
has_many :banks, through: :bank_categories
has_many :contents

## bank_categories テーブル
| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| bank_id     | references | null: false, foreign_key: true |
| category_id | references | null: false, foreign_key: true |

### Association
belongs_to :category
belongs_to :bank

## contents テーブル
| Column      | Type       | Options     |
| ----------- | ---------- | ----------- |
| detail      | string     | null: false |
| bank_id     | references | null: false |
| category_id | references | null: false |
| user_id     | references | null: false |

### Association
belongs_to :category
belongs_to :banking
belongs_to :user
