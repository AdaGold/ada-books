# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# db/seeds.rb
authors = [
  {
    name: "Margot Lee Shetterly",
    bio_url: "https://en.wikipedia.org/wiki/Roxane_Gay"
  },
  {
    name: "Sandi Metz",
    bio_url: "https://en.wikipedia.org/wiki/Sandi_Metz"
  },
  {
    name: "Octavia E. Butler",
    bio_url: "https://en.wikipedia.org/wiki/Octavia_E._Butler"
  },
  {
    name: "Jim Butcher",
    bio_url: "https://en.wikipedia.org/wiki/Jim_Butcher"
  }
]

count = 0
authors.each do |author|
  if Author.create(author)
    count += 1
  end
end

puts "Created #{count} authors"


books = [
  {
    title: "Practical Object Oriented Programming in Ruby",
    description: "This book explores Object-Oriented concepts in Ruby.",
    author_id: (Author.find_by name: "Sandi Metz").id,
    publication_date: 2020
  },
  {
    title: "An Untamed State",
    description: "The novel explores the interconnected themes of race, privilege, sexual violence, family, and the immigrant experience. An Untamed State is often referred to as a fairy tale because of its structure and style, especially in reference to the opening sentence, \"Once upon a time, in a far-off land, I was kidnapped by a gang of fearless yet terrified young men with so much impossible hope beating inside their bodies it burned their very skin and strengthened their will right through their bones,\" and the author's exploration of the American dream and courtship of Mireille's parents",
    author_id: (Author.find_by name: "Margot Lee Shetterly").id,
    publication_date: 2014
  },
  {
    title: "Storm Front",
    description: "Dirty Harry Potter",
    author_id: (Author.find_by name: "Jim Butcher").id,
    publication_date: 2000
  },    
]

count = 0
books.each do |book|
  if Book.create(book)
    count += 1
  end
end

puts "Created #{count} books"

genres = [
  {
    name: "Nonfiction"
  },
  {
    name: "Fiction"
  },  
  {
    name: "Coding"
  },  
  {
    name: "Sci Fi"
  },  
  {
    name: "Fantasy"
  },  
]

count = 0
genres.each do |genre|
  if Genre.create(genre)
    count += 1
  end
end

puts "Created #{count} genres"

