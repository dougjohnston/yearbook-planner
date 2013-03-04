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
    titles = %w(Elementary Secondary Seniors Ministries Athletics Academics Events)
    blank_page = true
    titles.shuffle.each_with_index do |title, i|
      color = "%06x" % (rand * 0xffffff)
      section = Section.create!(yearbook: yb, title: title, section_order: i+1, color: color)
      section.assign_to(User.order('rand()').first)

      # Create some spreads
      (rand(15) + 2).times do |j|
        users = school.users.order('rand()')
        user1 = users.first
        user2 = users.last
        deadline = yb.deadlines.order('rand()').first
        spread = Spread.create!(section: section, deadline: deadline, title: "#{title} Spread ##{j+1}", spread_order: i+j)
        spread.left_page.update_attribute(:title, nil) if blank_page
        #spread.left_page.update_attribute(:title, "#{title} Test Page ##{i+j}")
        #spread.right_page.update_attribute(:title, "#{title} Test Page ##{i+j+1}")
        spread.assign_to(user1)
        spread.assign_to(user2) if rand(3) == 1
        blank_page = false
      end
    end
  end
end
