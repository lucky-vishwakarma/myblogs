img1 = File.open(Rails.root + "app/assets/images/blog1.jpeg")
img2 = File.open(Rails.root + "app/assets/images/blog3.jpeg")
img3 = File.open(Rails.root + "app/assets/images/blog4.jpeg")
user = User.create(name: "TestUser", email: "testuser@gmail.com", password: "12345678")
records = [
	{title: "Natures", description: "Discover the world of natural wonder on your doorstep with this first book of nature! Beginning in spring", image: img1},
	{title: "Envoirment", description: "World Environment Day is held each year on June 5. It is one of the principal vehicles through which the United Nations (UN) stimulates worldwide awareness of the environment and enhances political attention and action. ", image: img2},
	{title: "Study", description: "The education system in Canada encompasses both publicly-funded and private schools", image: img3}
]

records.each do |data|
	u = user.posts.new(data)
	u.save
end