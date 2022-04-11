Given(/the following tasks in the database/) do |task_table|
    task_table.hashes.each do |task|
        Task.create(task)
        # each returned element will be a hash whose key is the table header.
        # you should arrange to add that movie to the database here.
    end
  end

  When(/I go on the tasks page/) do
    visit tasks_path
  end

  Then /"(.*)" should appear before "(.*)"/ do |a, b|
    page.body.should =~ /#{a}.*#{b}/m
  end