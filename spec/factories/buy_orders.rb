FactoryBot.define do
  factory :buy_order do
    post_code { '123-4567' }
    area_id { 2 }
    city { '東京都' }
    address { '1-1' }
    phone_number { "0#{rand(0..9)}0#{rand(1_000_000..99_999_999)}" }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
