# README

## users テーブル

| column               | type     | option                                 |
| ---------------------| ---------| ---------------------------------------|
| first_name           | string   | null: false                            |
| family_name          | string   | null: false                            |
| first_name_kana      | string   | null: false                            |
| family_name_kana     | string   | null: false                            |
| email                | string   | null: false, default: "", unique: true |
| encrypted_password   | string   | null: false, default: ""               |
| nickname             | string   | null: false                            |
| birthday             | date     | null: false                            |

### association

- has_many :items
- has_many :buys

### items テーブル

| column               | type           | option                         |
| ---------------------| -------------- | ------------------------------ |
| name                 | string         | null: false                    |
| status_id            | integer        | null: false                    |
| category_id          | integer        | null: false                    |
| area_id              | integer        | null: false                    |
| explanation          | text           | null: false                    |
| detail_id            | integer        | null: false                    |
| shipping_day_id      | integer        | null: false                    |
| price                | integer        | null: false                    |
| user                 | references     | null: false, foreign_key: true |

### association

- belongs_to :user
- has_one :buy

## buyers テーブル

| column               | type           | option                         |
| ---------------------| -------------- | ------------------------------ |
| post_code            | string         | null: false                    |
| city                 | string         | null: false                    |
| area_id              | integer        | null: false                    |
| address              | string         | null: false                    |
| phone_number         | string         | null: false                    |
| buy                  | references     | null: false, foreign_key: true |
| building_name        | string         |                                |

### association

- belongs_to :buy

### buys テーブル

| column               | type           | option                         |
| ---------------------| -------------- | ------------------------------ |
| user                 | references     | null: false, foreign_key: true |
| item                 | references     | null: false, foreign_key: true |

### association

- belongs_to :user
- belongs_to :item
- has_one :buyer