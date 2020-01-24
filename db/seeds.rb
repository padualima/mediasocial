puts "Creating Lists"
lists = ["Destaques", "Famosos", "Políticos", "Festivais", "Reality Show", "Atualidades", "Business", "Startups"]
lists.each do |list|
  List.find_or_create_by!( description: list)
end
puts "Created lists"

puts "Creating the accounts networking"
accounts = ["Instagram", "Facebook", "Twitter", "Linkedin", "GitHub"]
accounts.each do |account|
  Account.find_or_create_by!( description: account)
end
puts "Created accounts"

puts "Creating the Users"
30.times do
  u = User.find_or_create_by!(name: Faker::Name.name, username: Faker::Internet.domain_word)
  num = [1,2,3,4,5,6].sample
  u.image_user.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'profile', "#{num}.jpeg")), filename: "#{num}.jpeg")
end
puts "Created Users"

puts "Creating the Accounts of Users"
users = User.all
users.each do |user|
  rand(1..accounts.count).times do |act|
    AccountUser.create!(
      user_id: user.id,
      account_id: Account.all.sample.id
    )
  end
end
puts "Created accounts of Users"

puts "Creating the Lists of Users"
users = User.all
users.each do |user|
  rand(1..lists.count).times do |act|
    ListUser.create!(
      user_id: user.id,
      list_id: List.all.sample.id
    )
  end
end
puts "Created lists of Users"

puts "Creating the Post"

150.times do |x|
  user = User.all.sample
  list = ListUser.where(user_id: user).sample.list_id
  account = AccountUser.where(user_id: user).sample.account
  link = account.description.downcase

  v = Post.create!(
    body: Faker::Lorem.paragraph(sentence_count: 2, supplemental: false, random_sentences_to_add: 4),
    user_id: user.id,
    list_id: list,
    account_id: account.id,
    link_social: "https://#{link}.com/#{user.username}"
  )
  if x % 2 == 0
    num = [1,2,3,4,5,6].sample
    v.image.attach(io: File.open(Rails.root.join('app', 'assets', 'images', "#{num}.jpg")), filename: "#{num}.jpg")
  end
end
puts "Created the Post of Users"
