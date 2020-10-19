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
| birth_year       | string  |  null: false |
| birth_month      | string  |  null: false |
| birth_day        | string  |  null: false |

### Association

- has_many :items
- has_many :comments
- has_many :purchases

## items

| Column           | Type    | Options      |
| ---------------- | ------- | ------------ |
| image            | ActiveStorageで実装     |
| product          | text    |  null: false |
| description      | text    |  null: false |
| category         |active_hash             |
| status           |active_hash             |
| delivery_charge  |active_hash             |
| delivery_area    |active_hash             |
| delivery_days    |active_hash             |
| price            | string  |  null: false |
| user_id          |references              |

### Association

- belongs_to :user
- has_one :purchase
- has_many :comments
- belongs_to :active_hash

## purchases

| Column           | Type    | Options      |
| ---------------- | ------- | ------------ |
| card_number      | string  |  null: false |
| expiration_month | string  |  null: false |
| expiration_day   | string  |  null: false |
| security_code    | string  |  null: false |
| item_id          | references             |
| user_id          | references             |

### Association

- belongs_to :user
- belongs_to :item
- has_one :delivery_address

## delivery_addresses

| Column           | Type    | Options      |
| ---------------- | ------- | ------------ |
| post_code        | string  |  null: false |
| prefectures      | active_hash            |
| city             | string  |  null: false |
| address1         | string  |  null: false |
| address2         | string  |  null: false |
| building_name    | string  |  null: false |
| phone_number     | string  |  null: false |
| user_id          |references              |

### Association

- belongs_to :purchase
- belongs_to :active_hash

## comments

| Column           | Type    | Options      |
| ---------------- | ------- | ------------ |
| comment          | text    | null: false  |
| item_id          |references              |
| user_id          |references              |

### Association

- belongs_to :user
- belongs_to :item


## active_hash
  delivery_charge
  delivery_area
  delivery_days
  prefectures

  ### Association

  - has_many :items
  - has_many :delivery_addresses