#テーブル設計

## users

| Column           | Type    | Options      |
| ---------------- | ------- | ------------ |
| nick_name        | string  |  null: false |
| email            | string  |  null: false |
| password         | string  |  null: false |
| family_name      | string  |  null: false |
| first_name       | string  |  null: false |
| family_name_kana | string  |  null: false |
| first_name_kana  | string  |  null: false |
| birth_day        | date    |  null: false |


### Association

- has_many :items
- has_many :comments
- has_many :orders

## items

| Column             | Type       | Options            |
| ------------------ | ---------- | ------------------ |
| product            | string     |  null: false       |
| description        | text       |  null: false       |
| category_id        | integer    |  null: false       |
| status_id          | integer    |  null: false       |
| delivery_charge_id | integer    |  null: false       |
| prefecture_id      | integer    |  null: false       |
| delivery_day_id    | integer    |  null: false       |
| price              | integer    |  null: false       |
| user               | references |  foreign_key: true |

### Association

- belongs_to :user
- has_one :order
- has_many :comments


## order

| Column           | Type       | Options           |
| ---------------- | ---------- | ----------------- |
| user             | references | foreign_key: true |
| item             | references | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :delivery_address

## delivery_addresses

| Column           | Type          | Options            |
| ---------------- | ------------- | ------------------ |
| post_code        | string        |  null: false       |
| prefecture_id    | integer       |  null: false       |
| city             | string        |  null: false       |
| address          | string        |  null: false       |
| building_name    | string        |                    |
| phone_number     | string        |  null: false       |
| order            | references    |  foreign_key: true |

### Association

- belongs_to :order

## comments

| Column           | Type       | Options           |
| ---------------- | ---------- | ----------------- |
| comment          | text       | null: false       |
| user             | references | foreign_key: true |
| item             | references | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item


## active_hash
  category
  delivery_charge
  delivery_area
  delivery_days
  prefectures

  ### Association

  - has_many :items
  - has_many :delivery_addresses