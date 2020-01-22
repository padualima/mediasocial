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
10.times do
  User.find_or_create_by!( name: Faker::Name.name, username: Faker::Internet.domain_word )
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
13000.times do
  x = User.all.sample
  Post.create!(
    body: Faker::Lorem.paragraph(sentence_count: 2, supplemental: false, random_sentences_to_add: 4),
    user_id: x.id,
    list_user_id: ListUser.where(user_id: x).sample.list_id,
    account_user_id: AccountUser.where(user_id: 4).sample.account_id
  )
end
puts "Created the Post of Users"
