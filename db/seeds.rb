# Non-admin User creation
User.create(
  username: "Iggy95",
  password: "password",
  name: "Igor Veyner",
  birthdate: "1995-02-10",
  funds: 1000000
)

# Admin User creation
User.create(
  username: "sIrwin",
  password: "password",
  name: "Steve Irwin",
  birthdate: "1962-02-22",
  funds: 10000000,
  admin: true
)

# Exhibit creation
seal_pool = Exhibit.create(
  name: "Central Garden & Sea Lion Pool",
  biome: "Pacific Ocean coastline",
  image_url: "https://www.cooperation.com.au/Photo%20Albums/Canada-NYC%202006/10%20-%20New%20York%20City/slides/Sea%20Lion%20Central%20Park%20Zoo.JPG",
  description: "At the heart of the park, our sea lion gang can be seen sunning themselves or swimming amidst the Manhattan skyline. The exhibit features both above and below water viewing of some of our most acrobat swimmers."
)

polar_circle = Exhibit.create(
  name: "Polar Circle",
  biome: "Arctic",
  image_url: "https://iamavig.files.wordpress.com/2017/08/central-park-zoo-penguins.jpg?w=1200",
  description: "At the heart of Manhattan, this exhibit boasts harbor seals and birds from the ends of the earth. Penguins and puffins are a nice respite from the hustle and bustle."
)

# Species creation
seal = Species.create(
  name: "Zalophus californianus",
  common_name: "California Sea Lion",
  conservation_status: "Least Concern",
  image_url: "https://upload.wikimedia.org/wikipedia/commons/7/74/California_sea_lion_in_La_Jolla_%2870568%29.jpg",
  description: "The California sea lion (Zalophus californianus) is a coastal eared seal native to western North America. It is one of six species of sea lion. Its natural habitat ranges from southeast Alaska to central Mexico, including the Gulf of California. They mainly haul-out on sandy or rocky beaches, but they also frequent manmade environments such as marinas and wharves. Sea lions feed on a number of species of fish and squid, and are preyed on by killer whales and great white sharks."
)

penguin = Species.create(
  name: "Eudyptes chrysolophus",
  common_name: "Macaroni Penguin",
  conservation_status: "Vulnerable",
  image_url: "https://upload.wikimedia.org/wikipedia/commons/thumb/8/8e/SGI-2016-South_Georgia_%28Cooper_Bay%29%E2%80%93Macaroni_penguin_%28Eudyptes_chrysolophus%29_01.jpg/825px-SGI-2016-South_Georgia_%28Cooper_Bay%29%E2%80%93Macaroni_penguin_%28Eudyptes_chrysolophus%29_01.jpg",
  description: "The macaroni penguin (Eudyptes chrysolophus) is a species of penguin found from the Subantarctic to the Antarctic Peninsula.  It bears a distinctive yellow crest, and the face and upperparts are black and sharply delineated from the white underparts."
)

# Animal creation
Animal.create(
  name: "Maximillion",
  age: rand(1..20),
  weight: rand(5..50),
  image_url: "https://c532f75abb9c1c021b8c-e46e473f8aadb72cf2a8ea564b4e6a76.ssl.cf5.rackcdn.com/2020/04/09/h97t7yy8u_Julie_Larsen_Maher_5921_California_Sea_Lion_Show_with_trainer_SLP_CPZ_04_18_10_hr.jpg",
  description: "A sweetheart. Loves to eat fish",
  exhibit_id: seal_pool.id,
  species_id: seal.id
)

Animal.create(
  name: "Sam",
  age: rand(1..20),
  weight: rand(5..50),
  image_url: "https://www.centralpark.com/downloads/1424/download/sea-lion-at-central-park-zoo.jpe?cb=783665e2e86dabe11fdbe675f24e26c4",
  description: "A sweet boy. Loves to swim",
  exhibit_id: seal_pool.id,
  species_id: seal.id
)

Animal.create(
  name: "Tim",
  age: rand(1..15),
  weight: rand(3..30),
  image_url: "https://newsroom.wcs.org/dnnimagehandler.ashx?mode=file&file=/Portals/164/_Julie%20Larsen%20Maher_9478_Macaroni%20Penguins_CPZ_06%2022%2017.JPG&w=785&h=500&resizemode=crop",
  description: "Enjoys Swimming",
  exhibit_id: polar_circle.id,
  species_id: penguin.id
)

Animal.create(
  name: "Samantha",
  age: rand(1..15),
  weight: rand(3..30),
  image_url: "https://i.redd.it/47myk1xrx7bz.jpg",
  description: "Enjoys eating fish",
  exhibit_id: polar_circle.id,
  species_id: penguin.id
)

# Donation Creation
25.times do
  donation = Donation.create(
    amount: rand(1..500),
    species_id: rand(1..2),
    user_id: rand(1..2)
  )
  donation.add_donation
end