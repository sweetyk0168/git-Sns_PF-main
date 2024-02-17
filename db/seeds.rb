# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.find_or_create_by!(email: ENV['ADMIN_EMAIL']) do |admin|
    admin.password = ENV['ADMIN_PASSWORD']
end

Customer.find_or_create_by!(email: "guest@example.com") do |customer|
    customer.last_name = "ゲスト"
    customer.first_name = "ゲスト"
    customer.last_name_kana = "ゲスト"
    customer.first_name_kana = "ゲスト"
    customer.postal_code = "1234567"
    customer.address = "a県a市△-△-△"
    customer.telephone_number = "12345678910"
    customer.is_deleted = false
    customer.customer_introduction = "ゲストユーザーです"
    customer.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/logo.jpg"), filename:"logo.jpg")
    customer.password = "aichan0168"
end

Customer.find_or_create_by!(email: "test1@gmail.com") do |customer|
    customer.last_name = "test1"
    customer.first_name = "test1"
    customer.last_name_kana = "test1"
    customer.first_name_kana = "test1"
    customer.postal_code = "1234567"
    customer.address = "a県a市〇〇△-△-△"
    customer.telephone_number = "12345678910"
    customer.is_deleted = false
    customer.customer_introduction = "テストユーザー用アカウントです"
    customer.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/logo.jpg"), filename:"logo.jpg")
    customer.password = "aichan0168"
end

Genre.find_or_create_by!(id: 1) do |genre|
    genre.name = "ライブ"
end

Event.find_or_create_by!(id: 1) do |event|
    event.genre_id = 1
    event.name = "〇〇イベント"
    event.introduction = "本日より〇〇イベントのチケット受付開始！\r\n詳細は下記サイトをご確認ください。"
    event.post_status = true
    event.url_strings = "〇〇event.com"
end

Good.find_or_create_by!(id: 1) do |good|
    good.name = "〇〇イベント マフラータオル"
    good.introduction = "使い勝手の良いスポーツタオル。\r\n■サイズ：〇〇×〇〇〇ｍｍ\r\n"
    good.post_status = true
    good.price = 1500
    good.event_id = 1
    good.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/towel.jpg"), filename:"towel.jpg")
end

Good.find_or_create_by!(id: 2) do |good|
    good.name = "〇〇イベント Tシャツ（白）"
    good.introduction = "〇〇イベント限定dawnTシャツ\r\nサイズ：S、M、L、XLまであります。"
    good.post_status = true
    good.price = 1500
    good.event_id = 1
    good.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/t-shirt.jpg"), filename:"t-shirt.jpg")
end

Good.find_or_create_by!(id: 3) do |good|
    good.name = "〇〇イベント キャップ"
    good.introduction = "〇〇イベント限定キャップ\r\nサイズ：フリーサイズ（頭囲〇〇cm～〇cm）"
    good.post_status = true
    good.price = 6000
    good.event_id = 1
    good.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/black_cap.jpg"), filename:"black_cap.jpg")
end

Good.find_or_create_by!(id: 4) do |good|
    good.name = "〇〇イベントTシャツ（黒）"
    good.introduction = "〇〇イベント限定dawn黒Tシャツ\r\nサイズ：S、M、L、XLまであります。"
    good.post_status = true
    good.price = 4500
    good.event_id = 1
    good.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/black_t-shirt.jpg"), filename:"black_t-shirt.jpg")
end

EventTicket.find_or_create_by!(id: 1) do |event_ticket|
    event_ticket.ticket_name = "〇〇イベント シートチケット（特典付き）"
    event_ticket.ticket_introduction = "〇〇イベントの受付が開始しました。"
    event_ticket.ticket_price = 8800
    event_ticket.sales_status = true
    event_ticket.ticket_startday = "2023年10月20日"
    event_ticket.ticket_endday = "2023年11月30日"
    event_ticket.ticket_place = "渋谷特設会場"
    event_ticket.event_title = "〇〇イベント"
    event_ticket.performance_date = "2023年12月8日"
    event_ticket.event_id = 1
end

EventTicket.find_or_create_by!(id: 2) do |event_ticket|
    event_ticket.ticket_name = "〇〇イベント シートチケット"
    event_ticket.ticket_introduction = "〇〇イベントの受付が開始しました。"
    event_ticket.ticket_price = 7000
    event_ticket.sales_status = true
    event_ticket.ticket_startday = "2023年10月20日"
    event_ticket.ticket_endday = "2023年11月30日"
    event_ticket.ticket_place = "渋谷特設会場"
    event_ticket.event_title = "〇〇イベント"
    event_ticket.performance_date = "2023年12月8日"
    event_ticket.event_id = 1
end

EventQuestionnairesQuestion.find_or_create_by!(id: 2) do |event_questionnaires_question|
    event_questionnaires_question.title = "〇〇イベントアンケート"
    event_questionnaires_question.content = "この度は〇〇イベントに参加いただき、誠にありがとうございました。\r\nよろしければアンケートにご協力ください。"
end