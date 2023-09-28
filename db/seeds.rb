require 'csv'

Movie.delete_all
ProductionCompany.delete_all
Page.delete_all

# grab the filename
filename = Rails.root.join('db/top_movies.csv')
puts "Loading movies from the csv file: #{filename}"

csv_data = File.read(filename)
movies = CSV.parse(csv_data, headers: true, encoding: 'utf-8')

movies.each do |m|
  production_company = ProductionCompany.find_or_create_by(name: m['production_company'])
  if production_company.valid?
    # create movie
    movie = production_company.movies.create(
      title: m['original_title'],
      year: m['year'],
      duration: m['duration'],
      description: m['description'],
      average_vote: m['avg_vote']
    )

  else
    puts "Invalid movie #{m['orignal_title']}" unless movie&.valid?
    # puts "invalid production company #{m["production_company"]} for movie #{m['original_title']}"
  end
end

Page.create(
  title: 'About the Data',
  content: 'The data powering this website comes directly from Kaggle.',
  permalink: 'about_the_data'
)
Page.create(
  title: 'Contact us',
  content: 'If you like this website, plese reach us at obviously_fake@GAKE.COM',
  permalink: 'contact'
)

# puts "Created #{ProductionCompany.count} Production Companies"
puts "Created #{Movie.count} movies"
