# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Generate Category
10.times do
  name = Faker::Book.unique.genre
  description = Faker::Lorem.sentence(word_count: 20)
  img_url = Faker::LoremFlickr.image
  Category.create!(name:, description:, img_url:)
end

# Generate default user database
user = User.create!(name: 'Phong Nguyen', email: 'mattowindy@gmail.com', phone: '0123456789', address: 'KTX khu A',
                    password: '111111', password_confirmation: '111111')
user.cart = Cart.new
shop = user.shops.create!(name: 'Phương Nam', phone: '0355138315', address: '132/23 Linh Trung, Thủ Đức',
                          description: Faker::Lorem.sentence(word_count: 20))
shop.books.create!([{ title: 'Mỗi Lần Vấp Ngã Là Một Lần Trưởng Thành', price: 72, amount: 20, author: 'Liêu Trí Phong',
                      publisher: 'NXB Thanh Niên', descrition: 'Mỗi chúng ta từ nhỏ đến lớn, dù ít dù nhiều đều đã từng trải qua những lúc cảm thấy đau khổ, đây chính là trở ngại mà chúng ta thường nói tới. Tôi tin rằng sẽ không một người nào dám khẳng định cuộc đời của họ chẳng bao giờ gặp trở ngại. Đó chính là cuộc sống.', img_url: 'https://cdn0.fahasa.com/media/catalog/product/v/v/vvvv_7.jpg', category_ids: [Category.order('RAND()').first.id] },
                    { title: 'Tôi Quyết Định Sống Cho Chính Tôi (Tái Bản 2020)', price: 79, amount: 20,
                      author: 'Kim Suhyun', publisher: 'NXB Thanh Niên', descrition: 'Vậy ý nghĩa của cuộc sống rốt cuộc là gì? Sau nhiều lần chất vấn, câu trả lời tôi tìm thấy không còn là đáp án cá nhân mà trở thành đáp án của cả một cộng đồng, đó chính là hiện thực hóa giá trị của bản thân trong xã hội.', img_url: 'https://cdn0.fahasa.com/media/catalog/product/9/7/9786049781414_2.jpg', category_ids: [Category.order('RAND()').first.id] },
                    { title: 'Nhà Giả Kim', price: 79, amount: 20,
                      author: 'Paulo Coelho', publisher: 'NXB Thanh Niên', descrition: 'Cuốn tiểu thuyết này kể về Santiago - một cậu bé chăn cừu nghèo người Tây Ban Nha, phiêu lưu đến châu Phi để tìm kiếm và thực hiện giấc mơ của mình.', img_url: 'https://salt.tikicdn.com/cache/w1200/ts/product/83/30/87/737846efdb9f28f0f51352cacf9225c5.jpg', category_ids: [Category.order('RAND()').first.id] },
                    { title: 'Đắc Nhân Tâm', price: 79, amount: 20,
                      author: 'Dale Carnegie', publisher: 'NXB Thanh Niên', descrition: ' Đắc nghĩa là được, Nhân nghĩa là người, Tâm nghĩa là tim, Đắc Nhân Tâm có thể hiểu đơn giản là nghệ thuật thu phục lòng người. Con người phải hiểu rõ và thành thật với bản thân, quan tâm và hiểu biết đến những người xung quanh, để từ đó nhận ra và khơi gợi những tiềm năng ẩn giấu nơi họ, giúp họ ngày càng phát triển hơn.', img_url: 'https://sachhaymienphi.com/wp-content/uploads/2021/12/sach-dac-nhan-tam-dale-carnegie-sach-hay-mien-phi.jpg', category_ids: [Category.order('RAND()').first.id] },
                    { title: 'Cách nghĩ để thành công', price: 79, amount: 20,
                      author: 'Napoleon Hill', publisher: 'NXB Thanh Niên', descrition: 'Cách Nghĩ Để Thành Công mang tới cho bạn triết lý thành đạt, đồng thời cung cấp phương pháp để bạn lên kế hoạch chi tiết để đạt được thành công đó. Không chỉ có lý thuyết suông, tác phẩm này được dẫn chứng từ những trường hợp thực tế, ví dụ như Edison - nhà phát minh lỗi lạc, Henry Ford - ông trùm của nền công nghiệp xe hơi,... Napoleon Hill, tác giả của Cách Nghĩ Để Thành Công, đã dành ra 30 năm để phỏng vấn hơn 500 người thành công trong nhiều lĩnh vực khác nhau, từ đó đúc kết lại những triết lý và viết nên tác phẩm này.', img_url: 'https://salt.tikicdn.com/cache/w1200/media/catalog/product/c/a/cach_nghi_de_thanh_cong.jpg', category_ids: [Category.order('RAND()').first.id] },
                    { title: 'Hạt giống tâm hồn', price: 79, amount: 20,
                      author: 'Nhiều tác giả', publisher: 'NXB Thanh Niên', descrition: 'Bộ sách hạt giống tâm hồn là bộ sách được tổng hợp các câu chuyện, bức tranh đầy ý nghĩa về cuộc sống của nhiều tác giả khác nhau. Đó là những câu chuyện về sự thành công, tấm lòng cao đẹp giữa con người với con người. Bộ sách giúp nuôi dưỡng cho bạn có một tâm hồn đẹp, trong sáng, luôn vui tươi và lạc quan.', img_url: 'https://salt.tikicdn.com/cache/w1200/media/catalog/product/h/g/hgth_-_1_2.jpg', category_ids: [Category.order('RAND()').first.id] }])

# Generate users database
10.times do |n|
  name =  Faker::Name.name
  email = "example-#{n + 1}@bookstore.com"
  address = Faker::Address.full_address
  phone = Faker::Number.leading_zero_number(digits: 10)
  password = 'password'
  user = User.create!(name:, email:, address:, phone:, password:,
                      password_confirmation: password)
  user.cart = Cart.new
end

# Generates shops for a sunset of users
users = User.order(:created_at).take(5)
users.each do |user|
  5.times do
    name = Faker::Name.name
    phone = Faker::Number.leading_zero_number(digits: 10)
    address = Faker::Address.full_address
    description = Faker::Lorem.sentence(word_count: 20)
    shop = user.shops.create!(name:, phone:, address:, description:)
    50.times do
      title = Faker::Book.title
      author = Faker::Book.author
      publisher = Faker::Book.publisher
      price = Faker::Number.between(from: 1, to: 1000)
      amount = 10
      description1 = Faker::Lorem.sentence(word_count: 20)
      img_url = Faker::LoremFlickr.image
      category_ids = []
      category_ids.push Category.order('RAND()').first.id
      shop.books.create!(title:, price:, amount:, author:, publisher:, descrition: description1, img_url:,
                         category_ids:)
    end
  end
end
