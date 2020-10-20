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
| first_name _kana | string  |  null: false |
| birth_day        | date    |  null: false |


### Association

- has_many :items
- has_many :comments
- has_many :purchases

## items

| Column             | Type    | Options      |
| ------------------ | ------- | ------------ |
| product            | string  |  null: false |
| description        | text    |  null: false |
| category_id        | integer |  null: false |
| status_id          | integer |  null: false |
| delivery_charge_id | integer |  null: false |
| delivery_area_id   | integer |  null: false |
| delivery_days_id   | integer |  null: false |
| price              | string  |  null: false |
| user               | references             |

### Association

- belongs_to :user
- has_one :purchase
- has_many :comments
- belongs_to :active_hash

## purchases

| Column           | Type    | Options      |
| ---------------- | ------- | ------------ |
| user             | references             |
| item             | references             |

### Association

- belongs_to :user
- belongs_to :item
- has_one :delivery_address

## delivery_addresses

| Column           | Type    | Options      |
| ---------------- | ------- | ------------ |
| post_code        | string  |  null: false |
| prefectures_id   | integer |  null: false |
| city             | string  |  null: false |
| address          | string  |  null: false |
| building_name    | string  |  null: false |
| phone_number     | string  |  null: false |
| purchase         | references             |

### Association

- belongs_to :purchase
- belongs_to :active_hash

## comments

| Column           | Type    | Options      |
| ---------------- | ------- | ------------ |
| comment          | text    | null: false  |
| user             | references             |
| item             | references             |

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