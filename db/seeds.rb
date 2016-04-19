breeds_seed_file = File.join(Rails.root, 'db', 'seeds/breeds.yml')
breeds_config = YAML::load_file(breeds_seed_file)
Breed.create(breeds_config)
