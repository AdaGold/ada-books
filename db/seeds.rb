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

authors.each do |author|
  Author.create(author)
end


books = [
  {
    title: "Practical Object Oriented Programming in Ruby",
    description: "This book explores Object-Oriented concepts in Ruby.",
    author_id: (Author.find_by name: "Sandi Metz").id,
    publication_date: 2000,
  },
  {
    title: "An Untamed State",
    description: "The novel explores the interconnected themes of race, privilege, sexual violence, family, and the immigrant experience. An Untamed State is often referred to as a fairy tale because of its structure and style, especially in reference to the opening sentence, \"Once upon a time, in a far-off land, I was kidnapped by a gang of fearless yet terrified young men with so much impossible hope beating inside their bodies it burned their very skin and strengthened their will right through their bones,\" and the author's exploration of the American dream and courtship of Mireille's parents",
    author_id: (Author.find_by name: "Margot Lee Shetterly").id,
    publication_date: 2003,
  },
  {
    title: "Storm Front",
    description: "Dirty Harry Potter",
    author_id: (Author.find_by name: "Jim Butcher").id,
    publication_date: 1999,
  },    
]

books.each do |book|
  Book.create(book)
end