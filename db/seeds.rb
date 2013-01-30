# Create some basic seed data for development

# Create two schools
School.create!(name: "Alliance Academy International", short_name: "AAI", subdomain: 'aai')
School.create!(name: "Rancho Bernardo High School", short_name: "RBHS", subdomain: 'rbhs')

# For each school, create some yearbooks with sections, spreads, and pages
School.all.each do |school|
  # Create two users
  User.create!(school: school, email: "one@#{school.subdomain}.com", first_name: "Doug", last_name: "Johnston", password: "eoselan", password_confirmation: "eoselan")
  User.create!(school: school, email: "two@#{school.subdomain}.com", first_name: "Milton", last_name: "Coronel", password: "eoselan", password_confirmation: "eoselan")

  # Create two yearbooks
  Yearbook.create!(school: school, starting_year: Time.now.year - 1, ending_year: Time.now.year, theme: "Survivors")
  Yearbook.create!(school: school, starting_year: Time.now.year - 2, ending_year: Time.now.year - 1, theme: "Forever")

  # Fill each yearbook with some stuff
  school.yearbooks.all.each do |yb|
    # Create two deadlines
    Deadline.create!(yearbook: yb, title: "First Deadline", description: "Our first deadline", due_date: Time.now + 10.days)
    Deadline.create!(yearbook: yb, title: "Second Deadline", description: "Our second deadline", due_date: Time.now + 50.days)

    # Create a few sections
    titles = %w(Elementary Seniors Athletics Academics Events)
    titles.shuffle.each_with_index do |title, i|
      section = Section.create!(yearbook: yb, title: title, position: i+1)

      # Create some spreads with individual pages
      3.times do |j|
        spread = Spread.create!(section: section, position: i+j, split: true)
        p1 = Page.create!(spread: spread, title: "Test Page ##{i+j*2-1}")
        p2 = Page.create!(spread: spread, title: "Test Page ##{i+j*2}")
        spread.assign_to(User.order('rand()').first)
        p1.deadline = yb.deadlines.order('rand()').first
        p1.deadline = yb.deadlines.order('rand()').first
      end

      # Create some spreads with joined pages
      3.times do |j|
        spread = Spread.create!(section: section, title: "#{title} Spread ##{i+j}", position: i+j)
        spread.assign_to(User.order('rand()').first)
        spread.deadline = yb.deadlines.order('rand()').first
      end
    end
  end
end
