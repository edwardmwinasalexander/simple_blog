require 'faker'

puts "Destroy existing blog posts..."
BlogPost.destroy_all

puts "Create blog posts..."

10.times do
  BlogPost.create!(
    title: Faker::Lorem.sentence(word_count:3),
    body: Faker::Lorem.paragraph(sentence_count:4)
  )
end

puts "Blog posts #{BlogPost.count} created!"
